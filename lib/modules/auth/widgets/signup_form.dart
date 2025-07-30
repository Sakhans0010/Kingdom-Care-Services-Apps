import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
import 'package:kingdom_care_services_app/widgets/custom_material_button.dart';
import 'package:kingdom_care_services_app/widgets/custom_text_form_field.dart';
import 'package:kingdom_care_services_app/widgets/lowercase_formatter.dart';

import 'signUp_or_signIn_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isVisible = false;

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
          ),
          SizedBox(height: 10),
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  CustomTextField(
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
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    isPasswordTextField: true,
                    controller: confirmPasswordController,
                    keyBoardType: TextInputType.visiblePassword,
                    label: "Confirm Password",
                    obscureText: isVisible,
                    isVisible: isVisible,
                    onSuffixTapped: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 20),
          CustomMaterialButton(text: "Sign Up", onTap: () {}),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: SignUpOrSignInButton(
              text: "Already have an account?",
              buttonText: "Sign In",
              onButtonTapped: () {},
            ),
          ),
        ],
      ),
    );
  }
}
