import 'package:flutter/material.dart';

class AnimatedIconsStf extends StatefulWidget {
  const AnimatedIconsStf({super.key});

  @override
  State<AnimatedIconsStf> createState() => _AnimatedIconsStfState();
}

class _AnimatedIconsStfState extends State<AnimatedIconsStf>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations in flutter'),
      ),
      body: Center(
        child: InkWell(
            onTap: () => startAnimation(),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: animation,
              size: 40,
            )),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AnimatedIconsStf(),
  ));
}
