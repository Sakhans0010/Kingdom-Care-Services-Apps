import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leadingWidth: 150,
        leading: // Back button
        TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            // color: AppColors.neutral700,
            size: 18,
          ),
          label: Text(
            "Back to Sign In",

            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w500,
              //   color: AppColors.neutral700,
            ),
          ),
          style: TextButton.styleFrom(foregroundColor: AppColors.neutral700),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            margin: EdgeInsets.only(bottom: 100),
            decoration: BoxDecoration(
              color: AppColors.secondaryBackground,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                // Lock Icon
                Icon(
                  Icons.warning_amber_rounded,
                  size: 74,
                  color: AppColors.neutral700,
                ),

                const SizedBox(height: 16),

                // Title
                Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral900,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  "No worries, we'll send you reset instructions.",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.neutral700),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Email TextField
                CustomTextField(
                  controller: emailController,
                  keyBoardType: TextInputType.emailAddress,
                  hint: "Enter your email",
                  label: "Email Address",
                  prefixIcon: Icons.mail_outline,
                ),

                const SizedBox(height: 20),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    onPressed: () {
                      // TODO: Send reset link
                    },
                    child: const Text(
                      "Send Reset Link",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
