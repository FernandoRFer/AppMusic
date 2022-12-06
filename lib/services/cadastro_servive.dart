import 'dart:convert';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Usuario_model.dart';

class CadastroModel {
  Future<bool> postData(Map<String, dynamic>? login) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    final response = await http
        .post(Uri.http('10.0.2.2:27686', '/usuario'),
            headers: headers, body: jsonEncode(login))
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load login from the Internet');
    }
  }
}
