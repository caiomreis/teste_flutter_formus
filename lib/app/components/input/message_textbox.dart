import 'package:Formus/app/components/input/Formus_input_base.dart';
import 'package:flutter/material.dart';

class MessageTextbox extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String value) onChange;
  final Function() onSubmit;
  final String placeholder;
  final Widget? suffixIcon;
  final double? fontSize;
  final TextStyle? textStyle;
  final bool? readOnly;
  final FocusNode? focusNode;

  const MessageTextbox({
    super.key,
    required this.textEditingController,
    required this.placeholder,
    required this.onChange,
    required this.onSubmit,
    this.suffixIcon,
    this.fontSize,
    this.textStyle,
    this.readOnly,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return FormusInputBase(
      autoFocus: false,
      autoCorrect: true,
      keyboardType: TextInputType.text,
      onChange: (value) => onChange(value),
      onSubmit: () => onSubmit(),
      placeholder: placeholder,
      textController: textEditingController,
      expandedInputLines: 3,
    );
  }
}
