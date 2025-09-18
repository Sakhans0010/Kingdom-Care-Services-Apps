import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

import '../widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                // Title
                const Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Join Kingdom Care Services today.",
                  style: TextStyle(fontSize: 16, color: AppColors.darkGrey),
                ),
                const SizedBox(height: 40),

                SignupForm(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
