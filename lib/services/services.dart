import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final registrationServiceProvider = Provider((ref) => RegistrationService());

class RegistrationService {
  Future<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
  }) async {
    final response = await http.post(
      Uri.parse('http://localhost:3333/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }
}
