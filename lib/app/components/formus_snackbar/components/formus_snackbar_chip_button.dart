import 'package:Formus/app/components/text/body/body.dart';
import 'package:flutter/material.dart';

class FormusSnackBarChipButton extends StatelessWidget {
  final void Function()? onButtonTap;
  final String chipLabel;
  final Color color;

  const FormusSnackBarChipButton({
    Key? key,
    this.onButtonTap,
    required this.chipLabel,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 12.0,
      ),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          onButtonTap?.call();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Body.medium(
              text: chipLabel,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
