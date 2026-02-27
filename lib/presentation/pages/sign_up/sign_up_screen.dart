import 'package:flutter/material.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/common/app_bar/common_app_bar.dart';
import 'package:project_structure_bloc/presentation/common/buttons/common_button.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/common/text_field/common_text_field.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CommonAppBar(title: S.of(context).signUp),
      body: Padding(
        padding: .symmetric(
          vertical: Spacing.small,
          horizontal: Spacing.medium,
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            CommonTextField(
              labelText: S.of(context).name,
              hintText: S.of(context).enterName,
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
            Spacing.height15(),
            CommonTextField(
              labelText: S.of(context).phoneNumber,
              hintText: S.of(context).enterPhoneNumber,
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            Spacing.height15(),
            CommonTextField(
              labelText: S.of(context).email,
              hintText: S.of(context).enterEmail,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            Spacing.height15(),
            CommonTextField(
              labelText: S.of(context).password,
              hintText: S.of(context).enterPassword,
              controller: passwordController,
              keyboardType: TextInputType.text,
            ),
            Spacing.height15(),
            CommonButton(
              onTap: () {
                AppNavigator.go(AppRoutes.dashboardScreen);
              },
              text: S.of(context).signUp,
              textColor: AppColors.appbarBgColor,
            ),
            Spacing.height15(),
            Center(
              child: GestureDetector(
                onTap: () {
                  AppNavigator.go(AppRoutes.loginScreen);
                },
                child: CommonText(string: S.of(context).allReadyRegister),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
