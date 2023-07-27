// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNotFoundPage extends StatelessWidget {
  const PageNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: SizedBox(
            width: Get.width * 0.75,
            height: Get.width * 0.75,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
