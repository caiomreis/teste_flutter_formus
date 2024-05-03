import 'package:Formus/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonColorEnum { blue, orange }

class FormusButton extends StatelessWidget {
  final String text;
  final ButtonColorEnum? color;
  final bool? isLoading;
  final bool? disable;
  final Function()? onPress;

  const FormusButton({
    super.key,
    required this.text,
    this.color,
    this.onPress,
    this.isLoading = false,
    this.disable = false,
  });

  factory FormusButton.rightIcon({
    required String text,
    final ButtonColorEnum? color,
    final bool? isLoading,
    final Function()? onPress,
    final bool? disable,
  }) {
    return FormusButton(
      text: text,
      color: color,
      isLoading: isLoading ?? false,
      onPress: onPress,
      disable: disable ?? false,
    );
  }
  factory FormusButton.leftIcon({
    required String text,
    final ButtonColorEnum? color,
    final bool? isLoading,
    final Function()? onPress,
    final bool? disable,
  }) {
    return FormusButton(
      text: text,
      color: color,
      isLoading: isLoading ?? false,
      onPress: onPress,
      disable: disable ?? false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!isLoading!) {
          if (!disable!) onPress?.call();
        }
      },
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed) && !disable!) {
            return color == ButtonColorEnum.blue
                ? FormusColors.theme.blue.light
                : FormusColors.theme.blue.strong;
          }

          return _backgroundColor();
        }),
      ),
      child: isLoading!
          ? Container(
              alignment: Alignment.center,
              width: 42,
              height: 42,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: _textButtonColor(),
                  strokeWidth: 2,
                ),
              ),
            )
          : AnimatedContainer(
              height: 42,
              duration: const Duration(milliseconds: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.sora(
                      color: _textButtonColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      textBaseline: TextBaseline.ideographic,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Color _textButtonColor() {
    if (color == ButtonColorEnum.blue && disable!) {
      return const Color.fromRGBO(172, 181, 189, 1);
    }
    if (color == ButtonColorEnum.blue) return FormusColors.theme.blue.base;

    if (disable!) return const Color(0x7FFC7048);
    return FormusColors.theme.neutral.white;
  }

  Color _backgroundColor() {
    if (color == ButtonColorEnum.blue && disable!) {
      return const Color.fromRGBO(192, 192, 192, 0.15);
    }
    if (color == ButtonColorEnum.blue) return FormusColors.theme.blue.light;

    if (disable!) return const Color(0xFFFFF5F5);
    return FormusColors.theme.blue.medium;
  }
}
