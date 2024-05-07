import 'package:advanced_flutter/quiz/quiz_colors.dart';
import 'package:advanced_flutter/quiz/quiz_controller.dart';
import 'package:advanced_flutter/quiz/quiz_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  final int totalQ;
  final int correctA;

  const Result({super.key, required this.totalQ, required this.correctA});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    var resutl = ((widget.correctA /
                Provider.of<QuizController>(context).questionsList!.length) *
            100)
        .round();
    bool isPass = false;
    if (resutl > 50) {
      isPass = true;
      setState(() {});
    }
    return Scaffold(
      backgroundColor: ColorConstants.primary,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Container(
          width: 300,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Image.asset("assets/congrats.png"),
            Text(
              "${resutl} % Score",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: isPass ? Colors.green : Colors.red),
            ),
            Text("Quiz completed successfully..!"),
            SizedBox(
              height: 20,
            ),
            Text(
              "You attempt ${widget.totalQ} Questions and \nfrom that ${widget.correctA} answer is correct.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
        )),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => QuestionPage(),
              ),
            );
          },
          child: Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Try again",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
