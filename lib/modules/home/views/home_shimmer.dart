import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

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

  Widget _buildShimmerCircle({double size = 40}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCard({double height = 100}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBox(width: 120, height: 16, radius: 6),
          const SizedBox(height: 12),
          _buildShimmerBox(width: 200, height: 14, radius: 6),
          const Spacer(),
          _buildShimmerBox(width: 100, height: 12, radius: 6),
        ],
      ),
    );
  }

  Widget _buildQuickAction() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildShimmerCircle(size: 48),
          const SizedBox(height: 8),
          _buildShimmerBox(width: 60, height: 12, radius: 6),
        ],
      ),
    );
  }

  Widget _buildAnnouncementRow() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerCircle(size: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmerBox(width: 150, height: 14, radius: 6),
                const SizedBox(height: 6),
                _buildShimmerBox(width: double.infinity, height: 12, radius: 6),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildShimmerCircle(size: 48),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildShimmerBox(width: 100, height: 14),
                            const SizedBox(height: 6),
                            _buildShimmerBox(width: 80, height: 12),
                          ],
                        ),
                      ],
                    ),
                    _buildShimmerCircle(size: 32),
                  ],
                ),
                const SizedBox(height: 24),

                // Current Shift card
                _buildCard(height: 140),
                const SizedBox(height: 24),

                // Quick Actions
                _buildShimmerBox(width: 120, height: 16, radius: 6),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildQuickAction()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildQuickAction()),
                  ],
                ),
                const SizedBox(height: 24),

                // Analytics
                _buildShimmerBox(width: 120, height: 16, radius: 6),
                const SizedBox(height: 12),
                Column(
                  children: [
                    _buildCard(height: 80),
                    const SizedBox(height: 12),
                    _buildCard(height: 80),
                    const SizedBox(height: 12),
                    _buildCard(height: 80),
                  ],
                ),
                const SizedBox(height: 24),

                // Announcements
                _buildShimmerBox(width: 160, height: 16, radius: 6),
                const SizedBox(height: 12),
                Column(
                  children: [
                    _buildAnnouncementRow(),
                    const SizedBox(height: 12),
                    _buildAnnouncementRow(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
