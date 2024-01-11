import 'package:flutter/material.dart';

class HeroAnimationsS extends StatelessWidget {
  const HeroAnimationsS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Main Page'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HeroDetails())),
        child: Hero(
          tag: 'imageHero',
          child: Container(
            color: Colors.greenAccent,
            width: 150,
            height: 150,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.tour,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetails extends StatelessWidget {
  const HeroDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Details Page'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HeroAnimationsS())),
        child: Hero(
          tag: 'imageHero',
          child: Container(
            width: 150,
            height: 150,
            color: Colors.blueAccent,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.accessibility_outlined,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HeroAnimationsS(),
  ));
}
