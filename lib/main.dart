import 'package:flutter/material.dart';
import 'package:contact_app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();

  runApp(const Cepz());
}
