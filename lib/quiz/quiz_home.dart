import 'package:advanced_flutter/quiz/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  // Fetch questions data when the widget is initialized
  getQuestions() async {
    await Provider.of<QuizController>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizController>(context);
    return Scaffold(
      backgroundColor: Color(0xFF481450),
      body: provider.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${provider.questionNo + 1}/ ${provider.questionsList!.length}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 7,),
                    Text(
                      provider.questionsList?[provider.questionNo].question ??
                          '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: ListView.builder(
                    itemCount: provider
                        .questionsList?[provider.questionNo].options.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<QuizController>(context, listen: false)
                              .checkIsSelecte(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                              color: provider.selectedIndex == index
                                  ? provider.isCorrect
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.transparent,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '${index + 1}.  ${provider.questionsList?[provider.questionNo].options[index].text}',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Provider.of<QuizController>(context, listen: false)
                        .checkerQuestion(context);
                  },
                  child: Visibility(
                    visible: provider.selectedIndex == 0 ||
                            provider.selectedIndex == 1 ||
                            provider.selectedIndex == 2 ||
                            provider.selectedIndex == 3
                        ? true
                        : false,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Next',
                        style: TextStyle(
                            color: Color(0xFF481450),
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}
