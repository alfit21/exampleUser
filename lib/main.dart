// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'otherPages/pageNotFoundPage.dart';
import 'pages/Authpages/loginPage.dart';
import 'routes/pageRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // hanya bisa potrait
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/404',
        page: () => const PageNotFoundPage(),
      ),
      getPages: PageRoutes.pages,
    );
  }
}
