import 'package:advanced_flutter/quiz/quiz_colors.dart';
import 'package:flutter/material.dart';
// import 'package:quiz_app_using_api/utils/color_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Group_image.png"),
          Container(
            width: 200,
            height: 40,
            color: ColorConstants.primary,
          )
        ],
      ),
    );
  }
}