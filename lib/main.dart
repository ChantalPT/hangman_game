import 'package:flutter/material.dart';

void main() {
  runApp(const HangmanGame());
}

class HangmanGame extends StatelessWidget {
  const HangmanGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Hangman Game')),
        body: const Center(child: Text('A chambear')),
      ),
    );
  }
}
