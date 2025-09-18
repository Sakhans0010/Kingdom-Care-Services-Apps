import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/auth/providers/auth_provider.dart';
import 'package:kingdom_care_services_app/modules/auth/widgets/signup_or_signin_button.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
import 'package:kingdom_care_services_app/widgets/custom_material_button.dart';
import 'package:kingdom_care_services_app/widgets/custom_text_form_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isVisible = false;

  // Submit Login Form
  void _submitLoginForm() async {
    try {
      FocusScope.of(context).unfocus();

      if (!_formKey.currentState!.validate()) return;

      EasyLoading.show();

      // Call the signin function directly and await response
      final response = await ref
          .read(authProvider.notifier)
          .signin(
            email: emailController.text.toLowerCase().trim(),
            password: passwordController.text.trim(),
          );

      EasyLoading.dismiss();

      if (!mounted) return;

      Fluttertoast.showToast(
        msg: response.isSuccess
            ? response.message ?? ApiResponseMessages.signedInSuccessfully
            : response.error ?? ApiResponseMessages.somethingWentWrong,
        backgroundColor: response.isSuccess
            ? AppColors.primaryColor
            : Theme.of(context).colorScheme.error,
      );

      if (!mounted) return; // ensures widget is still in the tree

      if (response.isSuccess) {
        Navigator.pushReplacementNamed(context, Routes.mainScreen);
      }
    } catch (e) {
      EasyLoading.dismiss();

      log("Error: $e");
      if (!mounted) return;

      Fluttertoast.showToast(
        msg: ApiResponseMessages.somethingWentWrong,
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            controller: emailController,
            keyBoardType: TextInputType.emailAddress,

            label: "Email",
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required!";
              }
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegex.hasMatch(value)) {
                return "Enter a valid email address";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          StatefulBuilder(
            builder: (context, setState) {
              return CustomTextField(
                isPasswordTextField: true,
                controller: passwordController,
                keyBoardType: TextInputType.visiblePassword,
                label: "Password",
                obscureText: isVisible,
                isVisible: isVisible,

                onSuffixTapped: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password!';
                  }
                  return null;
                },
              );
            },
          ),

          // Forgot password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
          CustomMaterialButton(text: "Login", onTap: _submitLoginForm),

          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: SignUpOrSignInButton(
              text: "Don't have an account?",
              buttonText: "Sign Up",
              onButtonTapped: () {
                Navigator.pushReplacementNamed(context, Routes.signup);
              },
            ),
          ),
        ],
      ),
    );
  }
}
