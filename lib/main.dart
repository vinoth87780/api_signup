import 'package:api_signup/registration_page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(),
    );
  }
}
