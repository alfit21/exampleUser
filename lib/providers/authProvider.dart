// ignore_for_file: prefer_interpolation_to_compose_strings, file_names, prefer_const_declarations

import 'dart:convert';
import 'package:dio/dio.dart';

class AuthProvider {
  Future<Response?> auth(String user, String password) async {
    try {
      final url = 'https://bowindo.servehttp.com/login';

      var params = {
        "user_id": user,
        "user_password": password,
      };

      var response = await Dio().post(
        url,
        data: jsonEncode(params),
        options: Options(
          headers: {
            "Accept": "application/json",
            'Content-Type': 'application/json',
          },
        ),
      );

      return response;
    } catch (e) {
      return null;
    }
  }
}
