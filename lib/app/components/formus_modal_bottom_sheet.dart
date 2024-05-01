import 'package:Formus/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class FormusModalBottonSheet {
  Future<void> open({
    required Widget child,
    required BuildContext context,
    double? height,
    Color? color,
    bool? isDismissible,
    bool? isScrollControlled,
    bool? enableDrag,
  }) {
    return showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? true,
      isDismissible: isDismissible ?? true,
      backgroundColor: Colors.transparent,
      enableDrag: enableDrag ?? true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: color ?? FormusColors.theme.blue.light,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          height: height ?? MediaQuery.of(context).size.height * 0.9,
          child: child,
        );
      },
    );
  }
}
