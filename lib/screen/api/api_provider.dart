import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final loginProvider = Provider<LoginService>((ref) {
  final client = ref.watch(HttpClientProvider as AlwaysAliveProviderListenable);
  return LoginService(client);
});

class LoginService {
  final http.Client client;

  LoginService(this.client);

  Future<String> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('http://localhost:3333/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login');
    }
  }
}
