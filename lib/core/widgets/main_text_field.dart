import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool? isObscure;
  final Function? validator;
  final bool hideLabel;

  final void Function(String myString)? onFieldSubmitted;

  final TextEditingController textEditingController;
  final bool? isHighlighted;
  final ValueSetter<String>? onChanged;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final AutovalidateMode? autovalidateMode;

  // ignore: use_key_in_widget_constructors
  const CustomTextFormField(
      {required this.labelText,
      required this.keyboardType,
      this.isPassword = false,
      this.textInputAction = TextInputAction.next,
      this.focusNode,
      this.onFieldSubmitted,
      required this.textEditingController,
      required this.hintText,
      this.maxLength,
      this.minLines,
      this.maxLines = 1,
      this.suffix,
      this.readOnly = false,
      this.isObscure,
      this.suffixIcon,
      this.isHighlighted,
      this.onChanged,
      this.hideLabel = false,
      this.validator,
      this.autovalidateMode,
      this.inputFormatter});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatter,
      style: Theme.of(context).textTheme.labelMedium,
      maxLength: widget.maxLength,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        suffix: widget.suffix,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        border: InputBorder.none,
        filled: true,
      ),
      obscureText: widget.isObscure ?? false,
      onChanged: (val) =>
          widget.onChanged != null ? widget.onChanged!(val) : () {},
      validator:
          widget.validator == null ? null : (text) => widget.validator!(text),
      keyboardType: widget.keyboardType,
    );
  }
}
