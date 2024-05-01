import 'package:Formus/app/components/text/label/label.dart';
import 'package:Formus/app/style/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FormusCachedImage extends StatelessWidget {
  final String? imageUrl;
  final double heigth;
  final double width;
  final String? label;

  const FormusCachedImage({
    super.key,
    this.imageUrl,
    required this.heigth,
    required this.width,
    this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(width),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width),
        child: _getImage(),
      ),
    );
  }

  Widget _getImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: heigth,
          width: width,
          decoration: BoxDecoration(
            color: FormusColors.theme.neutral.white,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      placeholder: (context, url) => _getDefaultImage(),
      errorWidget: (context, url, error) => _getDefaultImage(),
    );
  }

  _getDefaultImage() {
    String resume = label != null ? label![0].toUpperCase() : 'Q';

    return Container(
      height: heigth,
      width: width,
      color: FormusColors.theme.blue.medium,
      child: Center(
        child: Label.bold(
          text: resume,
          color: FormusColors.theme.neutral.white,
        ),
      ),
    );
  }
}
