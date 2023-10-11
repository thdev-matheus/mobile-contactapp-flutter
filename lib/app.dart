import 'package:flutter/material.dart';
import 'package:contact_app/routes.dart';

class Cepz extends StatelessWidget {
  const Cepz({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: '/',
        title: 'Cepz',
      ),
    );
  }
}
