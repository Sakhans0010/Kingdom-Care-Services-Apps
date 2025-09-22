import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class DocumentsManagementScreen extends StatelessWidget {
  const DocumentsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,
        title: Text(
          "Manage Documents",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Upload New Document Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload New Document',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
            UploadDocumentCard(
              icon: Icons.description,
              iconColor: AppColors.primaryColor,
              title: 'Certification',
              subtitle: 'Upload your professional certifications',
              onUpload: () {},
            ),
            const SizedBox(height: 12),
            UploadDocumentCard(
              icon: Icons.badge,
              iconColor: AppColors.primaryColor,
              title: 'Identification',
              subtitle: 'Upload a valid form of identification',
              onUpload: () {},
            ),
            const SizedBox(height: 24),
            // My Documents Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Documents',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
            DocumentRow(
              title: 'First Aid Certification',
              subtitle: 'Approved',
              status: DocumentStatus.approved,
              onView: () {},
              onMore: () {},
            ),
            const SizedBox(height: 8),
            DocumentRow(
              title: 'Driver\'s License',
              subtitle: 'Pending',
              status: DocumentStatus.pending,
              onView: () {},
              onMore: () {},
            ),
            const SizedBox(height: 8),
            DocumentRow(
              title: 'CPR Certification',
              subtitle: 'Expired',
              status: DocumentStatus.expired,
              onView: () {},
              onMore: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Upload Document Card Widget
class UploadDocumentCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onUpload;

  const UploadDocumentCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary50,
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              onPressed: onUpload,
              icon: Icon(
                Icons.upload_rounded,
                size: 20,
                color: AppColors.secondaryBackground,
              ),
              label: Text(
                'Upload',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.secondaryBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Document Status Enum
enum DocumentStatus { approved, pending, expired }

// Document Row Widget
class DocumentRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final DocumentStatus status;
  final VoidCallback onView;
  final VoidCallback onMore;

  const DocumentRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.onView,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Color bgColor;
    IconData icon;

    switch (status) {
      case DocumentStatus.approved:
        statusColor = AppColors.success600;
        bgColor = AppColors.success50;
        icon = Icons.check_circle;
        break;
      case DocumentStatus.pending:
        statusColor = AppColors.warning600;
        bgColor = AppColors.warning50;
        icon = Icons.pending;
        break;
      case DocumentStatus.expired:
        statusColor = AppColors.danger600;
        bgColor = AppColors.danger50;
        icon = Icons.error;
        break;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(icon, color: statusColor),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,

          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: statusColor,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.grey),
              onPressed: onView,
            ),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: onMore),
          ],
        ),
      ),
    );
  }
}
