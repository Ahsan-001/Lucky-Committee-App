import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lucky_committee/app/Models/loginmodel.dart';

Future<LoginResponse> loginWithPhoneNumber(String phoneNumber) async {
  final url = 'https://perpaycommittee.com/api/login';
  final body = {'phone': phoneNumber};

  final response = await http.post(
    Uri.parse(url),
    body: body,
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(response.body);
    final loginResponse = LoginResponse.fromJson(json);
    return loginResponse;
  } else {
    throw Exception('Failed to login');
  }
}
