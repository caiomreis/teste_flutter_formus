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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
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
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) => _getDefaultImage(),
      errorWidget: (context, url, error) => _getDefaultImage(),
    );
  }

  _getDefaultImage() {
    String resume = label != null ? label! : 'Formus';

    return Container(
      height: heigth,
      width: width,
      color: FormusColors.theme.blue.medium,
      child: Center(
        child: Label.medium(
          textAlign: TextAlign.center,
          text: resume,
          color: FormusColors.theme.neutral.white,
        ),
      ),
    );
  }
}
