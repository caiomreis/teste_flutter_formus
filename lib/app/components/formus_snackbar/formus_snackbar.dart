import 'package:Formus/app/components/formus_snackbar/components/formus_snackbar_content.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormusSnackBar {
  static void _custom({
    required String title,
    String? message,
    required FormusSnackBarKindEnum kind,
    String? chipLabel,
    void Function()? onButtonTap,
    bool showTimer = false,
    Duration duration = const Duration(seconds: 4),
    BuildContext? context,
  }) {
    double bottomRadiusValue = showTimer ? 4 : 8;
    final FormusSnackBarContent content = FormusSnackBarContent(
      title: title,
      message: message,
      chipLabel: chipLabel,
      kind: kind,
      duration: duration,
      showTimer: showTimer,
      onButtonTap: onButtonTap,
    );

    ScaffoldMessenger.of(context ?? Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: duration,
          width: 333.0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(bottomRadiusValue),
              bottomLeft: Radius.circular(bottomRadiusValue),
              topLeft: const Radius.circular(8),
              topRight: const Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.all(0.0),
          content: content,
        ),
      );
  }

  static void simple({
    required String title,
    String? message,
    required FormusSnackBarKindEnum kind,
    bool showTimer = false,
    Duration duration = const Duration(seconds: 4),
    BuildContext? context,
  }) {
    _custom(
      title: title,
      message: message,
      kind: kind,
      showTimer: showTimer,
      duration: duration,
      context: context,
    );
  }

  static void chip({
    required String title,
    String? message,
    required FormusSnackBarKindEnum kind,
    required String chipLabel,
    required void Function() onButtonTap,
    bool showTimer = false,
    Duration duration = const Duration(seconds: 4),
    BuildContext? context,
  }) {
    _custom(
      title: title,
      message: message,
      kind: kind,
      chipLabel: chipLabel,
      onButtonTap: onButtonTap,
      showTimer: showTimer,
      duration: duration,
      context: context,
    );
  }

  static void closeable({
    required String title,
    String? message,
    required FormusSnackBarKindEnum kind,
    required void Function() onButtonTap,
    bool showTimer = false,
    Duration duration = const Duration(seconds: 4),
    BuildContext? context,
  }) {
    _custom(
      title: title,
      message: message,
      kind: kind,
      onButtonTap: onButtonTap,
      showTimer: showTimer,
      duration: duration,
      context: context,
    );
  }
}

enum FormusSnackBarKindEnum { success, error, warning, info }
