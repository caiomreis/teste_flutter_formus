import 'package:Formus/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class FormusRadioButton extends StatelessWidget {
  final bool isSelected;
  const FormusRadioButton({super.key, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(
            color: isSelected
                ? FormusColors.theme.neutral.black
                : FormusColors.theme.gray.base,
            width: 3,
          )),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? FormusColors.theme.neutral.black
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(
            color: FormusColors.theme.neutral.white,
            width: 1,
          ),
        ),
      ),
    );
  }
}
