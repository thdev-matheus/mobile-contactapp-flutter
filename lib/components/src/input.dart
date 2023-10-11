import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contact_app/styles/global_styles.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.isRequired = false,
    this.isPassword = false,
    this.borderRadius = 8,
    this.icon,
    this.label,
    this.helperText,
    this.error,
    this.validator,
    this.masks,
    this.changeAction,
    this.controller,
    required this.placeholder,
    this.keyType,
  });

  final bool isRequired;
  final bool isPassword;
  final double borderRadius;
  final IconData? icon;
  final String? label;
  final String? helperText;
  final String? error;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? masks;
  final void Function(String value)? changeAction;
  final TextEditingController? controller;
  final String placeholder;
  final TextInputType? keyType;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isVisible = false;

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyType,
      inputFormatters: widget.masks,
      onChanged: widget.changeAction,
      obscureText: widget.isPassword && !_isVisible,
      style: widget.error == null ? primaryTextStyle() : errorTextStyle(),
      cursorColor: primary,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        prefixIconColor: widget.error == null ? primary : error,
        hintText: widget.placeholder,
        helperText: widget.helperText,
        helperStyle: primaryTextStyle(size: 14),
        floatingLabelStyle:
            widget.error == null ? primaryTextStyle() : errorTextStyle(),
        labelStyle:
            widget.error == null ? primaryTextStyle() : errorTextStyle(),
        labelText: widget.isRequired ? '${widget.label} *' : widget.label,
        errorText: widget.error,
        errorStyle: errorTextStyle(size: 14),
        suffixIcon: widget.isPassword
            ? _isVisible
                ? IconButton(
                    color: Colors.black45,
                    icon: const Icon(Icons.visibility_off),
                    onPressed: changeVisibility,
                  )
                : IconButton(
                    color: Colors.black45,
                    icon: const Icon(Icons.visibility),
                    onPressed: changeVisibility,
                  )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: error,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: error,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
        ),
      ),
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
