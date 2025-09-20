import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/profile_image_container.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
import 'package:kingdom_care_services_app/widgets/custom_country_code_picker.dart';
import 'package:kingdom_care_services_app/widgets/custom_material_button.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';
import 'package:kingdom_care_services_app/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController(
    text: "Sophia",
  );
  final TextEditingController lastNameController = TextEditingController(
    text: "Carter",
  );

  final TextEditingController emailController = TextEditingController(
    text: "sophia.carter@example.com",
  );

  final TextEditingController phoneController = TextEditingController(
    text: "+1 123 456 7890",
  );

  final TextEditingController addressController = TextEditingController(
    text: "123 Harmony Lane, Healthville",
  );

  Map<String, String> selectedCountry = {
    'code': '+44',
    'countryCode': 'GB',
    'name': 'United Kingdom',
  }; // Default country code (UK)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,
        title: Text(
          "Edit Profile",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                margin: EdgeInsets.only(top: 10, bottom: 25),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ProfileImageContainer(
                          size: 128,
                          child: CustomNetworkImage(
                            imageUrl:
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuBuI2W-N9aAjsPmRD2mpPMBfNixQaonwuHBM6BHEMeEG6W4gQgHG7v3UPxyn0csloWpS5GEpPU79U-fbS0wGH9EGQpdfC77HxKHzm09dcxt8tIwAoE0BbZBcudcb2XDUpFkgtJlIsZZN6qsiO-9MDpVmyoN4k-A2lK_MoGO3pKZU2A1ihRIh3sO8Q6AxSth4M7_hH_6jE3vEYhO_DOugMna2I9ahzuMz-XyucYRlDv9yjzyZZTc6YhG2Bz2XmH1NEYM4dNPKZqUad7U",

                            borderWidth: 4,
                            borderColor: AppColors.primaryColor,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.primaryColor,
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Sophia Carter",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "Care Worker",
                      style: TextStyle(fontSize: 16, color: AppColors.darkGrey),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),

              // Personal Details
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Details",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 16),

                    _buildInfoTextfield(
                      title: "First Name",
                      controller: firstNameController,
                    ),

                    _buildInfoTextfield(
                      title: "Last Name",
                      controller: lastNameController,
                    ),

                    _buildInfoTextfield(
                      title: "Email",
                      controller: emailController,
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    _buildInfoTextfield(
                      title: "Phone Number",
                      controller: phoneController,
                      keyBoardType: TextInputType.phone,
                      isPhoneTextfield: true,
                    ),

                    _buildInfoTextfield(
                      title: "Address",
                      controller: addressController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Documents
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Documents",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.documentsManagementScreen,
                            );
                          },
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text("Add"),
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.secondaryColor,
                            foregroundColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _documentTile(
                      icon: Icons.description,
                      title: "Resume.pdf",
                      subtitle: "Uploaded on 15 Aug 2023",
                    ),
                    _documentTile(
                      icon: Icons.badge,
                      title: "Certification.pdf",
                      subtitle: "Uploaded on 10 Aug 2023",
                    ),
                    _documentTile(
                      icon: Icons.badge,

                      title: 'Resume.pdf',
                      subtitle: 'Expired on 01/06/2024',
                      isExpired: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              CustomMaterialButton(text: "Save Changes", onTap: () {}),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildInfoTextfield({
    required String title,
    required TextEditingController controller,
    TextInputType? keyBoardType,
    bool isPhoneTextfield = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 4),
          if (!isPhoneTextfield)
            CustomTextField(
              controller: controller,
              hint: title,
              keyBoardType: keyBoardType,
            ),
          if (isPhoneTextfield)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCountryCodePicker(
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
                  ],
                ),

                SizedBox(width: 15),
                Expanded(
                  child: CustomTextField(
                    controller: phoneController,

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
        ],
      ),
    );
  }

  Widget _documentTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isExpired = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isExpired
              ? Colors.red[100]
              : AppColors.primaryColor.withValues(alpha: 0.16),
          child: Icon(
            Icons.description,
            color: isExpired ? Colors.red : AppColors.primaryColor,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, size: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
