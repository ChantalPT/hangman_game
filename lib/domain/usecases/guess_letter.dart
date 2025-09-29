import 'package:hangman_game/domain/entities/word.dart';

class GuessLetter {
  Word call(Word word, String letter) {
    return word.guessLetter(letter);
  }
}
