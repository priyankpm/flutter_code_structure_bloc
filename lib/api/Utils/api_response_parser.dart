import 'dart:developer';

import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:project_structure_bloc/api/Error/failure.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';

Either<Failure, T> parseApiResponse<T>(
  Response response,
  T Function(Map<String, dynamic>) fromJson,
) {
  try {
    final data = response.data;

    if (data is! Map<String, dynamic> || data['status'] != true) {
      return Left(
        ServerFailure(
          data['message'] ?? S.of(AppConstant.globalCtx).something_went_wrong,
          statusCode: response.statusCode,
        ),
      );
    }

    final result = fromJson(data);
    return Right(result);
  } catch (e) {

    log('===rr===== $e');

    return Left(ServerFailure("Parsing error: ${e.toString()}"));
  }
}
