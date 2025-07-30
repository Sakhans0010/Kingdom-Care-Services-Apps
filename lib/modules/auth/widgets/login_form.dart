import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
import 'package:kingdom_care_services_app/widgets/custom_material_button.dart';
import 'package:kingdom_care_services_app/widgets/custom_text_form_field.dart';
import 'package:kingdom_care_services_app/widgets/lowercase_formatter.dart';

import 'signUp_or_signIn_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isVisible = false;

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
          ),
          SizedBox(height: 10),
          StatefulBuilder(
            builder: (context, setState) {
              return CustomTextField(
                isPasswordTextField: true,
                controller: passwordController,
                keyBoardType: TextInputType.visiblePassword,
                inputFormatters: [LowerCaseTextFormatter()],
                label: "Password",
                obscureText: isVisible,
                // onValidate: ValidationBuilder().email().build(),
                isVisible: isVisible,
                onSuffixTapped: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              );
            },
          ),

          SizedBox(height: 20),
          CustomMaterialButton(text: "Login", onTap: () {}),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: SignUpOrSignInButton(
              text: "Don't have an account?",
              buttonText: "Sign Up",
              onButtonTapped: () {},
            ),
          ),
        ],
      ),
    );
  }
}
