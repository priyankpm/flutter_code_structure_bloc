import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class Failure {
  final String message;
  final int? statusCode;

  Failure(this.message, {this.statusCode});
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message, {super.statusCode});
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

/// ERROR MESSAGE HANDLING FOR GOOGLE & APPLE SIGNIN
int firebaseErrorCodeToStatusCode(String code) {
  switch (code) {
    case 'network-request-failed':
      return 503;
    case 'too-many-requests':
      return 429;
    case 'operation-not-allowed':
      return 403;
    default:
      return 400;
  }
}

int googleSignInErrorCodeToStatusCode(String code) {
  switch (code) {
    case 'network-request-failed':
      return 503;
    case 'user-disabled':
      return 403;
    case 'user-not-found':
      return 404;
    case 'invalid-credential':
    case 'invalid-email':
    case 'wrong-password':
      return 401;
    default:
      return 400;
  }
}

String mapFirebaseErrorToMessage(String code) {
  switch (code) {
    case 'account-exists-with-different-credential':
      return 'An account already exists with a different sign-in method.';
    case 'invalid-credential':
      return 'Your login session expired. Please try again.';
    case 'user-disabled':
      return 'This account has been disabled. Contact support.';
    case 'operation-not-allowed':
      return 'Google sign-in is not enabled. Please try another method.';
    case 'network-request-failed':
      return 'Network error. Please check your internet connection.';
    case 'user-not-found':
      return 'No account found with these details.';
    default:
      return 'Something went wrong. Please try again.';
  }
}

String mapAppleErrorToMessage(dynamic error) {
  if (error is SignInWithAppleAuthorizationException) {
    switch (error.code) {
      case AuthorizationErrorCode.canceled:
        return 'You canceled Apple sign-in.';
      case AuthorizationErrorCode.failed:
        return 'Apple sign-in failed. Please try again.';
      case AuthorizationErrorCode.invalidResponse:
        return 'Apple returned an invalid response. Try again later.';
      case AuthorizationErrorCode.notHandled:
        return 'Apple sign-in could not be handled.';
      case AuthorizationErrorCode.unknown:
        return 'An unknown error occurred with Apple sign-in.';
      default:
        return 'Something went wrong. Please try again.';
    }
  } else if (error is FirebaseAuthException) {
    return mapFirebaseErrorToMessage(error.code);
  } else {
    return 'Unexpected error. Please try again.';
  }
}