import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
// Future<void> logout(String token) async {
//     final url = 'https://perpaycommittee.com/api/logout';
//     final headers = {'Authorization': 'Bearer $token'};

//     final response = await http.get(Uri.parse(url), headers: headers);

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       if (json['status'] == true) {
//         print('Logout successful');
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//       } else {
//         print('Logout failed');
//       }
//     } else {
//       print(widget.apiToken);
//       print('HTTP Error: ${response.statusCode}');
//     }
//   }