import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final BoxShape shape;
  final double borderWidth;
  final Color borderColor;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.size = 100,
    this.shape = BoxShape.circle,
    this.borderWidth = 0,
    this.borderColor = AppColors.primaryColor,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? _buildPlaceholder()
        : FadeInImage.assetNetwork(
            placeholder: '',
            image: imageUrl,
            fit: fit,
            imageErrorBuilder: (context, error, stackTrace) =>
                _buildPlaceholder(),
            placeholderErrorBuilder: (context, error, stackTrace) =>
                _buildPlaceholder(),
            placeholderCacheHeight: size.toInt(),
            placeholderCacheWidth: size.toInt(),
          );
  }

  Widget _buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AppColors.secondaryBackground,
      highlightColor: Colors.grey.shade200,
      child: Container(color: Colors.white),
    );
  }
}
