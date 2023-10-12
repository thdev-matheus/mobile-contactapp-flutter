import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';

class AddContactView extends StatelessWidget {
  const AddContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Adicionar contato',
          style: primaryTextStyle(),
        )
      ],
    );
  }
}
