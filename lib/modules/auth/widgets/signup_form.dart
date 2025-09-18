import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/auth/providers/auth_provider.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
// import 'package:form_validator/form_validator.dart';
import 'package:kingdom_care_services_app/widgets/custom_material_button.dart';
import 'package:kingdom_care_services_app/widgets/custom_text_form_field.dart';

import 'signUp_or_signIn_button.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Map<String, String> selectedCountry = {
    'code': '+44',
    'countryCode': 'GB',
    'name': 'United Kingdom',
  }; // Default country code (UK)

  var isVisible = false;

  // Submit SignUp Form
  void _submitSignupForm() async {
    try {
      // Hide the keyboard
      FocusScope.of(context).unfocus();

      // Validate form
      if (!_formKey.currentState!.validate()) return;

      String selectedCountryCode = selectedCountry['code']!;

      // Show loading
      EasyLoading.show();

      // Call signup through Riverpod notifier
      final response = await ref
          .read(authProvider.notifier)
          .signup(
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            email: emailController.text.toLowerCase().trim(),
            password: passwordController.text.trim(),
            dateOfBirth: dobController.text.trim(),
            phone: phoneController.text.trim(),
            countryCode: selectedCountryCode,
          );

      // Dismiss loading
      EasyLoading.dismiss();

      // ✅ Ensure widget is still mounted before using context
      if (!mounted) return;

      // Show success or error message
      Fluttertoast.showToast(
        msg: response.isSuccess
            ? response.message ?? ApiResponseMessages.signedUpSuccessfully
            : response.error ?? ApiResponseMessages.somethingWentWrong,

        backgroundColor: response.isSuccess
            ? null
            : Theme.of(context).colorScheme.error,
      );

      // Navigate on success
      if (response.isSuccess) {
        Navigator.pushReplacementNamed(context, Routes.mainScreen);
      }
    } catch (e, st) {
      // Dismiss loading
      EasyLoading.dismiss();

      // Log error
      log("Signup error: $e\n$st");

      if (!mounted) return;

      // Show toast for unexpected errors
      Fluttertoast.showToast(
        msg: ApiResponseMessages.somethingWentWrong,
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    }
  }

  // ✅ Format date into dd-MM-yyyy
  String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Future<void> _pickDate(BuildContext context) async {
    final today = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(today.year - 18, today.month, today.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year - 18, today.month, today.day),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      dobController.text = formatDate(picked); // ✅ set formatted string
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First + Last Name
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: firstNameController,
                  hint: "First Name",
                  prefixIcon: Icons.person_outline,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name is required!";
                    }
                    if (value.length < 2) {
                      return "First name must be at least 2 characters";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextField(
                  controller: lastNameController,
                  hint: "Last Name",
                  prefixIcon: Icons.person_outline,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name is required!";
                    }
                    if (value.length < 2) {
                      return "Last name must be at least 2 characters";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          CustomTextField(
            controller: emailController,
            keyBoardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.secondaryBackground,
                ),
                child: CountryCodePicker(
                  onChanged: (code) {
                    selectedCountry = {
                      'code': code.dialCode!,
                      'countryCode': code.code!,
                      'name': code.name!,
                    };
                  },
                  initialSelection:
                      selectedCountry['countryCode'], // UK as default
                  favorite: [
                    selectedCountry['code']!,
                    selectedCountry['countryCode']!,
                  ], // Optional favorites

                  padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                  showCountryOnly: false, // Show country name with flag
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  comparator: (a, b) => b.name!.compareTo(a.name!),

                  flagDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: CustomTextField(
                  controller: phoneController,
                  label: "Phone",
                  keyBoardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is required";
                    }
                    final phoneRegex = RegExp(
                      r'^\d{10,15}$',
                    ); // allow 10–15 digits
                    if (!phoneRegex.hasMatch(value)) {
                      return "Enter a valid phone number";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          GestureDetector(
            onTap: () => _pickDate(context),
            child: AbsorbPointer(
              child: CustomTextField(
                controller: dobController,
                label: "Date of Birth",
                prefixIcon: Icons.calendar_today_outlined,
                readOnly: true,
                onTap: () => _pickDate(context),

                suffixIcon: const Icon(Icons.calendar_today),

                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select your date of birth!";
                  }

                  try {
                    // Parse String -> DateTime
                    final dob = DateFormat("dd-MM-yyyy").parseStrict(value);

                    final today = DateTime.now();
                    final eighteenYearsAgo = DateTime(
                      today.year - 18,
                      today.month,
                      today.day,
                    );

                    if (dob.isAfter(eighteenYearsAgo)) {
                      return "You must be at least 18 years old";
                    }
                  } catch (e) {
                    return "Invalid date format";
                  }

                  return null;
                },
              ),
            ),
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
                    prefixIcon: Icons.lock_outline,

                    obscureText: !isVisible,
                    isVisible: isVisible,
                    onSuffixTapped: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password!';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters.';
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
                    prefixIcon: Icons.lock_outline,

                    obscureText: !isVisible,
                    isVisible: isVisible,
                    onSuffixTapped: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password!';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match.';
                      }
                      return null;
                    },
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 20),
          CustomMaterialButton(text: "Sign Up", onTap: _submitSignupForm),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: SignUpOrSignInButton(
              text: "Already have an account?",
              buttonText: "Sign In",
              onButtonTapped: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
            ),
          ),
        ],
      ),
    );
  }
}
