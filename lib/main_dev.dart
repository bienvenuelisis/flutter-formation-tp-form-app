import 'package:flutter/material.dart';
import 'package:form_app/features/welcome/presentation/screens/home_page.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
