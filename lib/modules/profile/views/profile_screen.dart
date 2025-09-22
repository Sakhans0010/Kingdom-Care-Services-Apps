import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/auth/providers/auth_provider.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/info_item.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/into_section.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/profile_card.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';

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
      log("Logout error: $e\n$st");

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
    // return ProfileShimmer();
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,

        title: Text(
          "Profile",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
        actionsPadding: EdgeInsets.only(right: 17),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.editProfileScreen);
            },
            icon: Icon(
              Icons.settings,
              color: AppColors.textpPrimaryColor,
              size: 28,
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              ProfileCard(),
              SizedBox(height: 30),
              // ------------------------
              // Personal Details Section
              // ------------------------
              InfoSection(
                title: "Personal Details",
                items: [
                  InfoItem(
                    icon: Icons.mail,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Email",
                    subtitle: "sophia.carter@email.com",
                  ),
                  InfoItem(
                    icon: Icons.call,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Phone",
                    subtitle: "+1 (555) 123-4567",
                  ),
                  InfoItem(
                    icon: Icons.location_on,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Address",
                    subtitle: "123 Main St, Anytown, USA",
                  ),
                ],
              ),

              // ------------------------
              // Documents Section
              // ------------------------
              InfoSection(
                title: "Documents",
                optionalButton: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.documentsManagementScreen,
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    foregroundColor: AppColors.primaryColor,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),

                  // icon: const Icon(Icons.add, size: 18),
                  child: Text(
                    "View All",
                    // style: Theme.of(context).textTheme.bodySmall!,
                  ),
                ),
                items: [
                  InfoItem(
                    icon: Icons.description,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Background Check",
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  ),
                  InfoItem(
                    icon: Icons.description,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Certification",
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  ),
                  InfoItem(
                    icon: Icons.description,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Resume",
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  ),
                ],
              ),

              // ------------------------
              // Settings Section
              // ------------------------
              InfoSection(
                title: "Settings",
                items: [
                  InfoItem(
                    icon: Icons.notifications,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Notifications",
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                      activeThumbColor: AppColors.secondaryBackground,
                      activeTrackColor: AppColors.primaryColor,
                    ),
                  ),
                  InfoItem(
                    icon: Icons.dark_mode,
                    iconBgColor: AppColors.secondaryColor,
                    iconColor: AppColors.primaryColor,
                    title: "Dark Mode",
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                      activeThumbColor: AppColors.secondaryBackground,
                      activeTrackColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ------------------------
              // Logout Button
              // ------------------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red.shade600,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _logOut,
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
