import 'package:flutter/material.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';

class QTextField extends StatefulWidget {
  const QTextField({
    required this.onChanged,
    super.key,
    this.label,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
  });
  final String? id;
  final String? label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  String getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = '';
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: widget.obscure,
        decoration: InputDecoration(
            labelText: widget.label,
            suffixIcon: Icon(
              widget.suffixIcon,
              color: secondaryTextColor,
            ),
            suffixIconColor: widget.suffixIconColor,
            prefixIcon: Icon(
              widget.prefixIcon ?? Icons.abc,
              color: secondaryTextColor,
            ),
            prefixIconColor: widget.prefixIconColor,
            helperText: widget.helper,
            hintText: widget.hint,
            hintStyle: TextStyle(color: secondaryTextColor)),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
