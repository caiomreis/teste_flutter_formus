import 'package:Formus/app/style/formus_icons.dart';
import 'package:flutter/material.dart';

class FormusSnackBarCloseButton extends StatelessWidget {
  const FormusSnackBarCloseButton({
    Key? key,
    this.onButtonTap,
    required this.color,
  }) : super(key: key);

  final void Function()? onButtonTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        onButtonTap?.call();
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 12.0,
          right: 16.0,
        ),
        child: FormusIcon(
          icon: FormusIconsEnum.close_bold,
          color: color,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
