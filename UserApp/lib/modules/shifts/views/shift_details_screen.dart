import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';
import 'package:kingdom_care_services_app/widgets/section_card.dart';

class ShiftDetailsScreen extends StatefulWidget {
  const ShiftDetailsScreen({super.key, required this.shift});

  final ShiftItem shift;

  @override
  State<ShiftDetailsScreen> createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,
        elevation: 1,
        title: Text(
          'Shift Details',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Shift Card
            SectionCard(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: CustomNetworkImage(
                      height: 250,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuCrMYByP2dDkdODQotjvrQDTVv0eUXpAENbLTgFsxM-5vwgC65z92gmlJm1gLXiPqWgzB5UzzHKbjFq4w72V5KGU4KE5avxdOUR4fAWVnZW6V6l6z0RBmp1ehgTs2jcqCzsOi-ahJe_pO3Y3xqRqyNlLMazKAmBqUElIqPHxhGLe3pD-U2dCc_lsCdlOJ_07CdPUAwH_86GpmeQjGJb9mM75-ut8_Gu_DmIFSQQhmG6pAZ1Gm3I9uwA4xmOBLrkPd3eWHTKzK_yHDf9",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Morning Care for Mr. Thompson',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              '123 Maple Street, Anytown',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.darkGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.schedule, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              '8:00 AM - 12:00 PM',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.darkGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$25/hr',
                                  style: TextStyle(
                                    color: Color(0xFF138AEC),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD1F2E5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),

                                  child: Text(
                                    'Confirmed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Color(0xFF059669),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Client Notes
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notes, color: Color(0xFF138AEC)),
                      SizedBox(width: 8),
                      Text(
                        'Client Notes',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Mr. Thompson requires assistance with morning routine, including medication reminders and light meal preparation. He enjoys engaging in conversation about current events.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),

            // Special Instructions
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.report, color: Color(0xFF138AEC)),
                      SizedBox(width: 8),
                      Text(
                        'Special Instructions',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please ensure all medications are administered as per the schedule. If any concerns arise, contact the family immediately.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),

            // Emergency Contacts
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.contact_phone, color: Color(0xFF138AEC)),
                      SizedBox(width: 8),
                      Text(
                        'Emergency Contacts',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildContactRow('Emily Thompson', 'Daughter'),
                  const SizedBox(height: 12),
                  _buildContactRow('David Thompson', 'Son'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(String name, String relation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFE3F2FD),
              child: const Icon(Icons.person, color: Color(0xFF138AEC)),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  relation,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFF138AEC),
          child: const Icon(Icons.call, color: Colors.white),
        ),
      ],
    );
  }
}
