import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';

class MyContactsView extends StatelessWidget {
  const MyContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Meus contato',
          style: primaryTextStyle(),
        )
      ],
    );
  }
}
