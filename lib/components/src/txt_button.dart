import 'package:flutter/material.dart';
import 'package:contact_app/styles/global_styles.dart';

class TXTButton extends StatelessWidget {
  const TXTButton(
      {super.key,
      this.secondary = false,
      required this.text,
      required this.action,
      this.textSize = 14});

  final bool secondary;
  final String text;
  final void Function() action;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: secondary ? secondaryButtonStyle : primaryButtonStyle,
      onPressed: action,
      child: Text(
        text,
        style: primaryTextStyle(
          color: white,
          weight: FontWeight.bold,
          size: textSize,
        ),
      ),
    );
  }
}
