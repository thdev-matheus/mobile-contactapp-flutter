import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          FontAwesomeIcons.addressCard,
          size: 100,
          color: primary,
        ),
        Text(
          'ContactAPP',
          style: TextStyle(
            fontSize: 40,
            color: primary,
          ),
        ),
      ],
    );
  }
}
