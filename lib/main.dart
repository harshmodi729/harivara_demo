import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harivara_demo/utils/app_color.dart';

import 'ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Harivara Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
        primarySwatch: AppColor.appColor,
      ),
      home: const Home(),
    );
  }
}
