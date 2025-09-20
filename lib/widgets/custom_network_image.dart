import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxShape shape;
  final double borderWidth;
  final Color borderColor;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = 100,
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
            height: height,
            width: width,
            imageErrorBuilder: (context, error, stackTrace) =>
                _buildPlaceholder(),
            placeholderErrorBuilder: (context, error, stackTrace) =>
                _buildPlaceholder(),
            placeholderCacheHeight: height.toInt(),
            placeholderCacheWidth: width.toInt(),
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
