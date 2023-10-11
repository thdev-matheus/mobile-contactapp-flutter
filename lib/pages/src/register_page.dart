import 'package:flutter/material.dart';

import 'package:contact_app/styles/global_styles.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:contact_app/components/components.dart';
import 'package:contact_app/blocks/blocks.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                separator(height: 30),
                Text(
                  'Cadastro',
                  style: primaryTextStyle(size: 36, weight: FontWeight.bold),
                ),
              ],
            ),
            separator(height: 24),
            const RegisterForm(),
            separator(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem cadastro? Faça login ',
                  style: primaryTextStyle(
                    weight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () => navigator(context: context, to: '/login'),
                  child: Text(
                    'aqui',
                    style: primaryTextStyle(
                      color: primary,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '.',
                  style: primaryTextStyle(
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
