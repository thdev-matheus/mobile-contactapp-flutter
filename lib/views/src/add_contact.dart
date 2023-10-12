import 'package:contact_app/blocks/blocks.dart';
import 'package:contact_app/components/components.dart';
import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';

class AddContactView extends StatelessWidget {
  const AddContactView({
    super.key,
    required this.animateToPage,
  });

  final void Function() animateToPage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Adicionar Contato',
          textAlign: TextAlign.center,
          style: primaryTextStyle(
            size: 24,
            weight: FontWeight.bold,
          ),
        ),
        separator(height: 22),
        AddContactForm(
          actionDone: animateToPage,
        ),
      ],
    );
  }
}
