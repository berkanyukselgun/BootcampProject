import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constants/theme/theme_constants.dart';

class cachedNetworkImageWidget extends StatelessWidget {
  const cachedNetworkImageWidget({
    super.key,
    this.posterUrl,
    this.height,
    this.width,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
  });

  final String? posterUrl;
  final double? height;
  final double? width;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: posterUrl ?? '',
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: shape,
            borderRadius: borderRadius,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
        );
      },
      placeholder: (context, url) => SizedBox(height: height, width: width, child: Center(child: const CircularProgressIndicator())),
      errorWidget: (context, url, error) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Icon(
            Icons.error,
            color: AppColors.vanillaShake,
          ),
        ),
      ),
    );
  }
}
