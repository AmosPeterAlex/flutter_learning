import 'package:advanced_flutter/quiz/quiz_controller.dart';
import 'package:advanced_flutter/quiz/quiz_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MultiProvider is used to provide the QuizController to the entire app
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider is used to provide the QuizController
        ChangeNotifierProvider(create: (context) => QuizController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // QuestionPage is set as the home screen of the app
        home: const QuestionPage(),
      ),
    );
  }
}
