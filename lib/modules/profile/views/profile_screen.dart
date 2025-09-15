import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/modules/auth/providers/auth_provider.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
import 'package:kingdom_care_services_app/utils/app_images.dart';
import 'package:kingdom_care_services_app/widgets/title_section_row.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  // Logout
  _logOut() async {
    try {
      EasyLoading.show();

      var response = await ref.read(authProvider.notifier).logout();

      // Dismiss loading
      EasyLoading.dismiss();

      // ✅ Ensure widget is still mounted before using context
      if (!mounted) return;

      // Show success or error message
      Fluttertoast.showToast(
        msg: response.isSuccess
            ? response.message ?? ApiResponseMessages.loggedOutSuccessfully
            : response.error ?? ApiResponseMessages.somethingWentWrong,

        backgroundColor: response.isSuccess
            ? null
            : Theme.of(context).colorScheme.error,
      );

      // Navigate on success
      if (response.isSuccess) {
        Navigator.pushReplacementNamed(context, Routes.login);
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          TitleSectionRow(title: "Profile"),
          SizedBox(height: 20),

          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            "Good Evening,\nJenny",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                optionWidget(
                  icon: AppImages.EDIT,
                  title: "Edit Profile",
                  onTap: () {},
                ),
                optionWidget(
                  icon: AppImages.SCHEDULE,
                  title: "Change Availability",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.availabilityScheduler);
                  },
                ),
                optionWidget(
                  icon: AppImages.SETTING,
                  title: "Settings",
                  onTap: () {},
                ),
                optionWidget(
                  icon: AppImages.LOGOUT,
                  title: "Log Out",
                  isLogOut: true,
                  onTap: _logOut,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile optionWidget({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool isLogOut = false,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        icon,
        color: isLogOut ? Colors.red : null,
        width: 24,
        height: 24,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 5),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 18,
          color: isLogOut ? Colors.red : Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
