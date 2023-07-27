// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, unnecessary_null_comparison

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

import '../../providers/authProvider.dart';
import '../../routes/nameRoutes.dart';

class AuthController extends GetxController {
  late TextEditingController user;
  late TextEditingController password;
  var passwordTerlihat = true.obs;
  var isProsesRun = true.obs;
  var checkSession = false.obs;
  var isNonaktifScreen = false.obs;

  @override
  void onInit() {
    user = TextEditingController();
    password = TextEditingController();
    user.text = '';
    password.text = '';
    super.onInit();
  }

  void showPassword() => passwordTerlihat.value = !passwordTerlihat.value;

  void isValueTrue() {
    isProsesRun.value = true;
    isNonaktifScreen.value = false;
    Get.focusScope!.unfocus();
    password.text = '';
    user.text = '';
  }

  void klikLogin() {
    Get.focusScope!.unfocus();
    isProsesRun.value = false;
    isNonaktifScreen.value = true;

    if (user.text.toString().isEmpty) {
      message('Info', 'User Belom di isi', Colors.red);
      isValueTrue();
    } else if (password.text.toString().isEmpty) {
      message('Info', 'Password Belom di isi', Colors.red);
      isValueTrue();
    } else {
      prosesLogin(user.text, password.text);
    }
    update();
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

  void prosesLogin(user, password) {
    var appleInBytes = utf8.encode(password);
    password = sha256.convert(appleInBytes).toString();
    try {
      AuthProvider().auth(user.toString(), password.toString()).then(
          (response) async {
        if (response != null) {
          if (response.statusCode == 200) {
            if (response.data['success'] == true) {
              try {
                var data = jsonDecode(jsonEncode(response.data['data']));
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(
                    'branch_id', data['branch_id'].toString());
                await prefs.setString(
                    'token', response.data['token'].toString());

                Get.offAllNamed(NameRoutes.homePage);
                isValueTrue();
              } catch (e) {
                isValueTrue();
              }
            } else {
              message('Info', response.data['message'], Colors.green[500]);
              isValueTrue();
            }
          } else {
            message('Info', 'status code ${response.statusCode}',
                const Color.fromARGB(255, 255, 35, 35));
            isValueTrue();
          }
        } else {
          message(
              'Info', 'respon null', const Color.fromARGB(255, 255, 35, 35));
          isValueTrue();
        }
      }, onError: (e) {
        message('Info', 'error respon', const Color.fromARGB(255, 255, 35, 35));
        isValueTrue();
      });
    } catch (e) {
      message(
          'Info', 'error luar respon', const Color.fromARGB(255, 255, 35, 35));
      isValueTrue();
    }
  }

  @override
  void onClose() {
    if (user != null) {
      user.text = '';
    }
    if (password != null) {
      password.text = '';
    }
    super.onClose();
  }
}
