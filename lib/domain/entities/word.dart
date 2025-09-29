// Represents a word in the hangman game
class Word {
  final String originalWord;
  final Set<String> lettersGuessed;
  final int maxAttempts;

  const Word({
    required this.originalWord,
    this.lettersGuessed = const {},
    this.maxAttempts = 5,
  });

  // Returns the word with guessed letters revealed and others as "_"
  String get display {
    return originalWord.split('').map((letter) {
      return lettersGuessed.contains(letter.toLowerCase()) ? letter : '_';
    }).join(' ');
  }

  // Number of wrong guesses
  int get wrongAttempts {
    return lettersGuessed.where((g) => !originalWord.contains(g)).length;
  }

  // Game state checks
  bool get isComplete => !display.contains('_');
  bool get isLost => wrongAttempts >= maxAttempts;

  // Add a new guess and return a new instance (immutability)
  Word guessLetter(String letter) {
    return Word(
      originalWord: originalWord,
      lettersGuessed: {...lettersGuessed, letter.toLowerCase()},
      maxAttempts: maxAttempts,
    );
  }
}
