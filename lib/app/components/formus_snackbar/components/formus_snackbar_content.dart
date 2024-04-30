// ignore_for_file: file_names

import 'package:Formus/app/components/formus_snackbar/components/formus_snackbar_chip_button.dart';
import 'package:Formus/app/components/formus_snackbar/components/formus_snackbar_close_button.dart';
import 'package:Formus/app/components/formus_snackbar/formus_snackbar.dart';
import 'package:Formus/app/components/formus_snackbar/formus_snackbar_controller.dart';
import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/style/formus_icons.dart';
import 'package:flutter/material.dart';

class FormusSnackBarContent extends StatelessWidget {
  final FormusSnackBarController controller;

  FormusSnackBarContent({
    Key? key,
    required FormusSnackBarKindEnum kind,
    required FormusIconsEnum icon,
    bool showTimer = false,
    required String title,
    String? message,
    String? chipLabel,
    void Function()? onButtonTap,
    Duration duration = const Duration(seconds: 4),
  })  : controller = FormusSnackBarController(
          duration: duration,
          kind: kind,
          showTimer: showTimer,
          onButtonTap: onButtonTap,
          icon: icon,
          message: message,
          title: title,
          chipLabel: chipLabel,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double bottomRadiusValue = controller.showTimer ? 4 : 8;
    return Stack(
      children: [
        Container(
          height: controller.height,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: controller.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(bottomRadiusValue),
              bottomLeft: Radius.circular(bottomRadiusValue),
              topLeft: const Radius.circular(8),
              topRight: const Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 12.0,
                ),
                child: FormusIcon(
                  icon: controller.icon,
                  color: controller.foregroundColor,
                  width: 24,
                  height: 24,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Body.medium(
                      text: controller.title,
                      color: controller.foregroundColor,
                    ),
                    if (controller.message != null)
                      Expanded(
                        child: Body.light(
                          text: controller.message!,
                          softWrap: true,
                          color: controller.foregroundColor,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                  ],
                ),
              ),
              if (controller.chipLabel != null)
                FormusSnackBarChipButton(
                  chipLabel: controller.chipLabel!,
                  color: controller.foregroundColor,
                  onButtonTap: controller.onButtonTap,
                ),
              if (controller.chipLabel == null &&
                  controller.onButtonTap != null)
                FormusSnackBarCloseButton(
                  onButtonTap: controller.onButtonTap,
                  color: controller.foregroundColor,
                ),
            ],
          ),
        ),
        if (controller.showTimer)
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: controller.margin, end: 333.0),
              duration: controller.leftDuration,
              builder: (context, value, child) {
                if (controller.margin < value) {
                  controller.margin = value;
                }
                return Container(
                  margin: EdgeInsets.only(
                    right: value,
                  ),
                  child: child,
                );
              },
              child: Container(
                height: 4.0,
                decoration: BoxDecoration(
                  color: controller.timerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
