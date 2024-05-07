import 'dart:convert';
import 'package:advanced_flutter/quiz/quiz_model.dart';
import 'package:advanced_flutter/quiz/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizController extends ChangeNotifier {
  List? questionsList; // List to store quiz questions
  bool isLoading = false; // Flag to track whether data is being loaded
  int questionNo = 0; // Current question index
  bool isCorrect = false; // Flag to track if the selected option is correct
  int? selectedIndex; // Index of the selected option
  bool isSelected = false; // Flag to track if an option is selected
  int results = 0; // Counter for correct answers

  // Fetch quiz data from the API
  getData() async {
    isLoading = true;
    notifyListeners();
    final url =
        Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz');
    try {
      final response = await http.get(url);
      print(response.statusCode);
      final decodeData = jsonDecode(response.body);
      questionsList = decodeData.map((e) => QuizModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  // Check and handle the selection of an option
  checkIsSelecte(int index) {
    if (isSelected == false) {
      isCorrect = questionsList?[questionNo].options![index].isCorrect!;
      selectedIndex = index;
      isSelected = true;
      notifyListeners();
    }
  }

  // Check the selected option, update results, and navigate to the next question
  checkerQuestion(BuildContext context) {
    if (questionsList?[questionNo].options![selectedIndex!].isCorrect == true) {
      results++;
      print("result is $results");
      notifyListeners();
    }

    if (questionNo < questionsList!.length - 1) {
      questionNo++;
    } else {
      // Navigate to the result screen when all questions are answered
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Result(
            correctA: results,
            totalQ: questionsList!.length,
          ),
        ),
      );
    }

    selectedIndex = null;
    isSelected = false;
    notifyListeners();
  }
}
/*
import 'dart:convert';
import 'package:advanced_flutter/quiz/quiz_model.dart';
import 'package:advanced_flutter/quiz/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizController extends ChangeNotifier {
  List? questionsList; // List to store quiz questions
  bool isLoading = false; // Flag to track whether data is being loaded
  int questionNo = 0; // Current question index
  bool isCorrect = false; // Flag to track if the selected option is correct
  int? selectedIndex; // Index of the selected option
  bool isSelected = false; // Flag to track if an option is selected
  int results = 0; // Counter for correct answers

  // Fetch quiz data from the API
  getData() async {
    isLoading = true; // Start loading
    notifyListeners();
    final url = Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz');
    try {
      final response = await http.get(url);
      print(response.statusCode);
      final decodeData = jsonDecode(response.body);
      // Convert JSON data to QuizModel objects and store in questionsList
      questionsList = decodeData.map((e) => QuizModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    isLoading = false; // Stop loading
    notifyListeners();
  }

  // Check and handle the selection of an option
  checkIsSelecte(int index) {
    if (isSelected == false) {
      // Check if the selected option is correct
      isCorrect = questionsList?[questionNo].options![index].isCorrect!;
      selectedIndex = index;
      isSelected = true;
      notifyListeners();
    }
  }

  // Check the selected option, update results, and navigate to the next question
  checkerQuestion(BuildContext context) {
    if (questionsList?[questionNo].options![selectedIndex!].isCorrect == true) {
      // If the selected option is correct, increment the results counter
      results++;
      print("result is $results");
      notifyListeners();
    }

    if (questionNo < questionsList!.length - 1) {
      questionNo++;
    } else {
      // Navigate to the result screen when all questions are answered
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Result(
          correctA: results,
          totalQ: questionsList!.length,
        ),
      ));
    }

    selectedIndex = null;
    isSelected = false;
    notifyListeners();
  }
}

 */
