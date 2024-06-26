import 'package:advanced_flutter/api/using%20dio/view/dio_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DioMain());
}

class DioMain extends StatelessWidget {
  const DioMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeDio(),
      debugShowCheckedModeBanner: false,
    );
  }
}
