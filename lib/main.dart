import 'package:flutter/material.dart';
import 'package:hangman_game/presentation/screens/widgets/home_screen.dart';

void main() {
  runApp(const HangmanGameApp());
}

class HangmanGameApp extends StatelessWidget {
  const HangmanGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangman Game',
      home: const HomeScreen(),
    );
  }
}
