import 'package:flutter/material.dart';

void navigator({
  required BuildContext context,
  required String to,
  bool remove = false,
}) {
  remove
      ? Navigator.of(context).pushNamedAndRemoveUntil(to, (route) => false)
      : Navigator.of(context).pushNamed(to);
}
