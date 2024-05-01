import 'package:Formus/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FormusInputBase extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String placeholder;
  final Function(String value) onChange;
  final Function() onSubmit;
  final bool obscureText;
  final bool autoCorrect;
  final bool enableSuggestions;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormater;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? fontSize;
  final TextStyle? textStyle;
  final bool? readOnly;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? expandedInputLines;

  const FormusInputBase({
    super.key,
    required this.textController,
    required this.keyboardType,
    required this.placeholder,
    required this.onChange,
    this.inputFormater,
    required this.onSubmit,
    this.obscureText = false,
    this.autoCorrect = true,
    this.enableSuggestions = true,
    this.autoFocus = true,
    this.suffixIcon,
    this.maxLength,
    this.fontSize,
    this.textStyle,
    this.readOnly,
    this.focusNode,
    this.prefixIcon,
    this.expandedInputLines,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: TextFormField(
          controller: textController,
          keyboardType: keyboardType,
          obscureText: obscureText,
          autofocus: autoFocus,
          enableSuggestions: enableSuggestions,
          autocorrect: autoCorrect,
          cursorColor: FormusColors.theme.gray.strong,
          maxLines: expandedInputLines ?? 1,
          cursorHeight: 20,
          maxLength: maxLength,
          readOnly: readOnly ?? false,
          inputFormatters: inputFormater,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FormusColors.theme.blue.strong,
              ),
            ),
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: const Color(0xFFFFFFFF),
            hintText: placeholder,
            counterStyle: GoogleFonts.sora(
              color: FormusColors.theme.gray.medium,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: GoogleFonts.sora(
              color: FormusColors.theme.gray.medium,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: GoogleFonts.sora(
            color: FormusColors.theme.gray.strong,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) {
            onChange(value);
          },
          onFieldSubmitted: (value) => onSubmit(),
          focusNode: focusNode ??
              FocusNode(
                descendantsAreFocusable: false,
                canRequestFocus: false,
              ),
        ),
      ),
    );
  }
}
