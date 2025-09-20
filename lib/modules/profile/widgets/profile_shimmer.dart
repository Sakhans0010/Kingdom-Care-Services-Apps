import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  Widget _buildShimmerBox({
    double width = double.infinity,
    double height = 16,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  Widget _buildShimmerRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmerBox(width: 140, height: 14, radius: 6),
                const SizedBox(height: 6),
                _buildShimmerBox(width: 100, height: 12, radius: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: AppColors.secondaryBackground,
          highlightColor: Colors.grey.shade200,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Profile avatar shimmer
                  Container(
                    width: 128,
                    height: 128,
                    padding: const EdgeInsets.all(4), // border width
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 4,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Name
                  _buildShimmerBox(width: 120, height: 18, radius: 6),
                  const SizedBox(height: 8),

                  // Role
                  _buildShimmerBox(width: 80, height: 14, radius: 6),
                  const SizedBox(height: 6),

                  // ID
                  _buildShimmerBox(width: 100, height: 12, radius: 6),
                  const SizedBox(height: 24),

                  // Personal Details Section
                  _buildShimmerBox(
                    width: double.infinity,
                    height: 20,
                    radius: 6,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildShimmerRow(),
                        _buildShimmerRow(),
                        _buildShimmerRow(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Documents Section
                  _buildShimmerBox(
                    width: double.infinity,
                    height: 20,
                    radius: 6,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildShimmerRow(),
                        _buildShimmerRow(),
                        _buildShimmerRow(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Settings Section
                  _buildShimmerBox(
                    width: double.infinity,
                    height: 20,
                    radius: 6,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [_buildShimmerRow(), _buildShimmerRow()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
