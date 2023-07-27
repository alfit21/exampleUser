// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:get/get.dart';
import '../pages/Authpages/loginPage.dart';
import '../pages/HomePages/homePage.dart';
import 'nameRoutes.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: NameRoutes.homePage,
      page: () => HomePage(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: NameRoutes.loginPage,
      page: () => LoginPage(),
      transition: Transition.topLevel,
    ),
  ];
}
