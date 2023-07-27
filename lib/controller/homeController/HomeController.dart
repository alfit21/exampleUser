// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_user/providers/homeProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var isReady = false;
  var listData = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      HomeProvider()
          .getUser('', '', token == null ? '' : token.toString())
          .then((response) async {
        if (response != null) {
          if (response.statusCode == 200) {
            if (response.data['success'] == true) {
              try {
                listData = jsonDecode(jsonEncode(response.data['data']));
                isReady = true;
                update();
              } catch (e) {
                isReady = true;
              }
            } else {
              message('Info', response.data['message'], Colors.green[500]);
              isReady = true;
            }
          } else {
            message('Info', 'status code ${response.statusCode}',
                const Color.fromARGB(255, 255, 35, 35));
            isReady = true;
          }
        } else {
          message(
              'Info', 'respon null', const Color.fromARGB(255, 255, 35, 35));
          isReady = true;
        }
      }, onError: (e) {
        message('Info', 'error respon', const Color.fromARGB(255, 255, 35, 35));
        isReady = true;
      });
    } catch (e) {
      message(
          'Info', 'error luar respon', const Color.fromARGB(255, 255, 35, 35));
      isReady = true;
    }
  }

  message(judul, pesan, warna) {
    Get.snackbar(
      judul,
      '',
      colorText: Colors.white,
      barBlur: 20,
      progressIndicatorBackgroundColor: Colors.white,
      showProgressIndicator: true,
      backgroundColor: warna,
      titleText: Center(
        child: Text(pesan.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      backgroundGradient: LinearGradient(colors: [
        Colors.black,
        Colors.black54,
        warna,
      ]),
      duration: const Duration(
        seconds: 3,
      ),
    );
  }
}
