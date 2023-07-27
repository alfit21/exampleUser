// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homeController/HomeController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (cont) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('List Data'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: cont.isReady
              ? Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('ID'),
                        Text('Nama'),
                        Text('Email'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.mediaQuery.size.width,
                      height: Get.mediaQuery.size.height * 0.8,
                      child: ListView.builder(
                        itemCount: cont.listData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cont.listData[index]['employee_id']
                                      .toString()),
                                  Text(cont.listData[index]['employee_name']
                                      .toString()),
                                  Text(cont.listData[index]['employee_mail']
                                      .toString()),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
