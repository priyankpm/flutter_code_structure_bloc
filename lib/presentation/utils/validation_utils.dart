import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';

extension Validator on String {
  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Please enter your email address";
    } else if (!regex.hasMatch(value)) {
      return "Email address is invalid";
    }
    return null;
  }

  static String? passwordValidator({String value = "",}) {
    List<String> errors = [];

    if (value.length < 8) {
      errors.add(S.of(AppConstant.globalCtx).atLeast8Characters);
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      errors.add(S.of(AppConstant.globalCtx).oneUppercaseLetter);
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      errors.add(S.of(AppConstant.globalCtx).oneLowerCaseLetter);
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      errors.add(S.of(AppConstant.globalCtx).oneNumber);
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errors.add(S.of(AppConstant.globalCtx).oneSpecialCharacter);
    }

    if (errors.isNotEmpty) {
      return '${S.of(AppConstant.globalCtx).passwordMustContain} ${errors.join(', ')}.';
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value, {int minLength = 10, int maxLength = 10}) {
    if (value == null || value.isEmpty) {
      return "Please enter your mobile number";
    }
    if (value.length < minLength) {
      return "Invalid mobile number";
    }
    if (value.length > maxLength) {
      return "Invalid mobile number";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Please enter confirm password";
    }
    if (password != confirmPassword) {
      return "Password does not match";
    }
    return null;
  }
}

void showError(String message) {
  Exception(message);
}