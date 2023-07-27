// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';

class HomeProvider {
  Future<Response?> getUser(
      String branchId, String departmentId, String token) async {
    final url = "https://bowindo.servehttp.com/employee/list?branch_id=%" +
        branchId.toString() +
        '&department_id=%' +
        departmentId.toString();

    try {
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            'token': token,
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
