// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authControllers/authControllers.dart';

class LoginPage extends StatelessWidget {
  final loginC = Get.put(AuthController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 180, bottom: 20, left: 25),
                  child: Text(
                    'Tess',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: loginC.user,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 72, 105, 255),
                            ),
                            // garis ketika di klik fokus
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 47, 255),
                              ),
                            ),
                            labelText: "User: ",
                            errorText: null,
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 34, 0, 255))),
                      ),
                      Obx(
                        () => TextField(
                          controller: loginC.password,
                          obscureText: loginC.passwordTerlihat.value,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.vpn_key,
                                color: Color.fromARGB(255, 72, 105, 255),
                              ),
                              suffixIcon: IconButton(
                                color: Colors.black45,
                                onPressed: () {
                                  loginC.showPassword();
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: Color(0XFF9BE8A3),
                                ),
                              ),
                              // garis ketika di klik fokus
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255),
                                ),
                              ),
                              labelText: "Password: ",
                              errorText: null,
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 0, 55, 255))),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 3),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 188, 139, 87),
                              Color.fromARGB(255, 232, 223, 165),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 57, 100, 254),
                          onTap: () {
                            loginC.klikLogin();
                          },
                          child: const Center(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  color: Color(0xFF0B2447),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => Container(
                  child: loginC.isProsesRun.value
                      ? Container()
                      : const Center(child: CircularProgressIndicator())),
            )
          ],
        ));
  }
}
