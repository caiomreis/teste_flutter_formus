import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/components/formus_snackbar/formus_snackbar.dart';
import 'package:Formus/app/style/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormusSnackBarController extends GetxController {
  double margin = 0.0;
  final DateTime startAt = DateTime.now();
  late final DateTime endAt;
  final Duration duration;
  final FormusSnackBarKindEnum kind;
  final bool showTimer;
  final String title;
  final String? message;
  final String? chipLabel;
  final void Function()? onButtonTap;

  FormusSnackBarController({
    required this.kind,
    required this.title,
    this.message,
    this.showTimer = false,
    this.duration = const Duration(seconds: 4),
    this.chipLabel,
    this.onButtonTap,
  }) {
    endAt = startAt.add(duration);
  }

  Duration get leftDuration => endAt.difference(DateTime.now());

  Color get backgroundColor {
    switch (kind) {
      case FormusSnackBarKindEnum.error:
        return FormusColors.theme.status.error;
      case FormusSnackBarKindEnum.warning:
        return FormusColors.theme.status.waring;
      case FormusSnackBarKindEnum.info:
        return FormusColors.theme.status.info;
      default:
        return FormusColors.theme.status.success;
    }
  }

  Color get foregroundColor {
    if (kind == FormusSnackBarKindEnum.info ||
        kind == FormusSnackBarKindEnum.error) {
      return FormusColors.theme.neutral.white;
    }
    return FormusColors.theme.neutral.black;
  }

  Color get timerColor => FormusColors.theme.neutral.black;

  double get height {
    if (message == null) {
      return 56.0;
    }
    if (showTimer) {
      return 72.0 + _calculateExtraSpace();
    }
    return 68.0 + _calculateExtraSpace();
  }

  double _calculateExtraSpace() {
    final Widget messageWidget = Body.light(
      text: message!,
      overflow: TextOverflow.visible,
      color: FormusColors.theme.neutral.black,
    ).build(Get.context!);
    double availableSpace = _calculateAvailableSpace();
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: message, style: (messageWidget as Text).style)
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);
    double quantityOfLines = textPainter.size.width / availableSpace;
    double extraSpace = 0.0;
    if (quantityOfLines > 1) {
      extraSpace = textPainter.size.height * (quantityOfLines.truncate() + 1.0);
    }
    return extraSpace;
  }

  double _calculateAvailableSpace() {
    if (chipLabel != null) {
      return 184.0;
    } else if (onButtonTap != null) {
      return 229.0;
    }
    return 265.0;
  }
}
