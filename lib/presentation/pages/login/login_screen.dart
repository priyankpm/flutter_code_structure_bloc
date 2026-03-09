import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_event.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_state.dart';
import 'package:project_structure_bloc/presentation/common/app_bar/common_app_bar.dart';
import 'package:project_structure_bloc/presentation/common/buttons/common_button.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/common/text_field/common_text_field.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CommonAppBar(title: S.of(context).loginScreen, isLeading: false),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              AppNavigator.go(AppRoutes.dashboardScreen);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: Spacing.small,
                horizontal: Spacing.medium,
              ),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  CommonTextField(
                    labelText: S.of(context).email,
                    hintText: S.of(context).enterEmail,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorMessage: state.emailError,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChangedEvent(value));
                    },
                  ),
                  Spacing.height15(),
                  CommonTextField(
                    labelText: S.of(context).password,
                    hintText: S.of(context).enterPassword,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    errorMessage: state.passwordError,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordChangedEvent(value));
                    },
                  ),
                  Spacing.height20(),
                  CommonButton(
                    onTap: () {
                      context.read<LoginBloc>().add(LoginSubmitEvent());
                    },
                    text: S.of(context).login,
                    textColor: AppColors.appbarBgColor,
                    isDisabled: !state.isValid,
                  ),
                  Spacing.height10(),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.push(AppRoutes.signUpScreen);
                      },
                      child: CommonText(string: S.of(context).newUser),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
