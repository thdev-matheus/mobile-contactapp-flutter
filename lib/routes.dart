import 'package:flutter/material.dart';

import 'package:contact_app/pages/pages.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  '/': (context) => const LoginPage(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/dashboard': (context) => const DashboardPage(),
};
