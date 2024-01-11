import 'package:advanced_flutter/animations/animation%20in%20navigation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondAnimation) {
                          return SecondPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 600)),
                  );
                },
                child: Text('Fade Animation')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return SecondPage();
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: const Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ));
                },
                child: Text('Slide Animation')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondAnimation) {
                          return SecondPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondAnimation, child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 600)),
                  );
                },
                child: Text('Scale Animation')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          alignment: Alignment.bottomCenter,
                          duration: Duration(milliseconds: 200),
                          child: SecondPage(),
                          childCurrent: this,
                          type: PageTransitionType.size));
                },
                child: Text('Using page package'))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
