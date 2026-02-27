import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project_structure_bloc/api/Error/failure.dart';
import 'package:project_structure_bloc/api/Utils/helper.dart';
import 'package:project_structure_bloc/core/storage/auth_storage.dart';
import 'package:project_structure_bloc/core/storage/token_storage.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';

class ApiClient {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final AuthStorage _authStorage;

  // Store last request info for retry
  RequestOptions? _lastRequest;

  ApiClient({
    required Dio dio,
    required TokenStorage tokenStorage,
    required AuthStorage authStorage,
  }) : _dio = dio,
       _tokenStorage = tokenStorage,
       _authStorage = authStorage {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenStorage.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Accept'] = 'application/json';
          _lastRequest = options;
          handler.next(options);
        },
        onError: (e, handler) async {
          print('==Request Token Refresh====${e.response?.statusCode == 401}');
          if (e.response?.statusCode == 401) {
            final refreshed = await _refreshToken(e.response?.data);
            if (refreshed && _lastRequest != null) {
              final retryResponse = await _retryRequest(_lastRequest!);
              return handler.resolve(retryResponse);
            }
          }
          handler.next(e);
        },
      ),
    );
  }

  String _constructUrl(String endpoint, bool useMainUrl) {
    return useMainUrl
        ? ApiEndPointsHelper.mainBaseUrl + endpoint
        : ApiEndPointsHelper.domainPrefix +
            ApiEndPointsHelper.domainTenantBaseIp +
            ApiEndPointsHelper.domainBaseEndPoint +
            ApiEndPointsHelper.domainBaseApiPoint +
            endpoint;
  }


  Options _buildOptions(Map<String, String>? headers, {String? contentType}) {
    return Options(headers: headers, contentType: contentType);
  }

  Failure handleError(DioException e) {
    final response = e.response;
    final statusCode = response?.statusCode;

    print('==statusCode===$statusCode');

    String extractMessage(Response? response) {
      try {
        if (response?.data is Map<String, dynamic>) {
          final data = response!.data as Map<String, dynamic>;
          if (data.containsKey('message')) return data['message'];
          if (data.containsKey('error')) return data['error'];
        }
        return S.of(AppConstant.globalCtx).something_went_wrong;
      } catch (_) {
        return S.of(AppConstant.globalCtx).unexpected_error_occurred;
      }
    }

    print('==e.type====${e.type}');

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkFailure(S.of(AppConstant.globalCtx).connection_timed_out);
    } else if (e.type == DioExceptionType.badResponse) {
      print('=error-statusCode===$statusCode');
      return ServerFailure(extractMessage(response), statusCode: statusCode);
    } else if (e.type == DioExceptionType.unknown &&
        e.error is SocketException) {
      return NetworkFailure(S.of(AppConstant.globalCtx).no_internet_connection);
    }

    return UnknownFailure(S.of(AppConstant.globalCtx).unexpected_error_occurred);
  }

  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    bool useMainUrl = false,
  }) async {
    try {
      final path = _constructUrl(endPoint, useMainUrl);
      return await _dio.get(
        path,
        queryParameters: queryParams,
        options: _buildOptions(headers),
      );
    } on DioException catch (e) {
      print('====error====$e');
      throw handleError(e);
    }
  }

  Future<Response> post(
    String endPoint,
    dynamic data, {
    Map<String, String>? headers,
    bool useMainUrl = false,
  }) async {
    try {
      final path = _constructUrl(endPoint, useMainUrl);
      if (useMainUrl == false) {
        _authStorage.setHasDataInAccount(true);
      }
      return await _dio.post(path, data: data, options: _buildOptions(headers));
    } on DioException catch (e) {
      print('====e=====$e');
      throw handleError(e);
    }
  }

  Future<Response> put(
    String endPoint,
    dynamic data, {
    Map<String, String>? headers,
    bool useMainUrl = false,
    dynamic params,
  }) async {
    try {
      final path = _constructUrl(endPoint, useMainUrl);
      return await _dio.put(
        path,
        data: data,
        options: _buildOptions(headers),
        queryParameters: params,
      );
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> patch(
    String endPoint,
    dynamic data, {
    Map<String, String>? headers,
    bool useMainUrl = false,
  }) async {
    try {
      final path = _constructUrl(endPoint, useMainUrl);
      return await _dio.patch(
        path,
        data: data,
        options: _buildOptions(headers),
      );
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> delete(
    String endPoint, {
    Map<String, String>? headers,
    bool useMainUrl = false,
  }) async {
    try {
      final path = _constructUrl(endPoint, useMainUrl);
      return await _dio.delete(path, options: _buildOptions(headers));
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> postFormData(
    String endPoint, {
    required Map<String, dynamic> fields,
    Map<String, File>? files,
    Map<String, String>? headers,
    bool useMainUrl = false,
  }) async {
    try {
      final path = _constructUrl(endPoint, useMainUrl);
      final formData = FormData();

      // Add form fields
      fields.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      // Add file uploads
      if (files != null) {
        for (final entry in files.entries) {
          if (entry.value.path.isNotEmpty) {
            final file = entry.value;
            final fileName = file.path.split('/').last;
            formData.files.add(
              MapEntry(
                entry.key,
                await MultipartFile.fromFile(file.path, filename: fileName),
              ),
            );
          }
        }
      }

      return await _dio.post(
        path,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            if (headers != null) ...headers,
          },
        ),
      );
    } on DioException catch (e) {
      print('====PostMart====$e');
      throw handleError(e);
    }
  }

  // ==================== Token Refresh Logic ====================
  Future<bool> _refreshToken(dynamic apiResponse) async {
    try {
      if (apiResponse != null) {
        if (apiResponse['result'] != null) {
          _tokenStorage.saveAccessToken(apiResponse['result']);
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  // ==================== Retry Request Logic ====================
  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final token = await _tokenStorage.getAccessToken();

    final updatedOptions = Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, 'Authorization': 'Bearer $token'},
      contentType: requestOptions.contentType,
      responseType: requestOptions.responseType,
      followRedirects: requestOptions.followRedirects,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      extra: requestOptions.extra,
    );

    return await _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: updatedOptions,
    );
  }
}
