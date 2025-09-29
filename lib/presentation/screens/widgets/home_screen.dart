import 'package:flutter/material.dart';
import 'package:hangman_game/data/datasources/word_remote_datasource.dart';
import 'package:hangman_game/data/repositories/word_repository_impl.dart';
import 'package:hangman_game/domain/entities/word.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Word currentWord;
  int won = 0;
  int lost = 0;
  bool loading = true;
  List<String> wordList = [];
  int currentIndex = 0;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWords();
  }

  Future<void> _fetchWords() async {
    setState(() {
      loading = true;
      errorMessage = null; // resetear error anterior
    });

    try {
      final repo = WordRepositoryImpl(WordRemoteDatasource());
      final words = await repo.getRandomWords(20);

      setState(() {
        wordList = words.map((w) => w.toLowerCase()).toList();
        currentIndex = 0;
        currentWord = Word(originalWord: wordList[currentIndex]);
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        errorMessage =
            "Error when trying to get words. Please try again or reload the page.";
      });
    }
  }

  void _nextWord() async {
    if (currentIndex < wordList.length - 1) {
      setState(() {
        currentIndex++;
        currentWord = Word(originalWord: wordList[currentIndex]);
      });
    } else {
      await _fetchWords(); // cuando se acaban, trae 20 más
    }
  }

  void onGuess(String letter) {
    setState(() {
      currentWord = currentWord.guessLetter(letter);

      if (currentWord.isComplete) {
        _nextWord();
      } else if (currentWord.isLost) {
        _nextWord();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xfff9f3e4),
          body: Center(
            child: SizedBox(
              width: 600,

              //podriamos probar con singlechildscrollview para tener scroll
              child: loading || wordList.isEmpty
                  ? const CircularProgressIndicator()
                  : Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Card(
                          elevation: 8,
                          margin: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          child: ConstrainedBox(
                            //permite colocar un tamano minimo y max a la card
                            constraints: BoxConstraints(minHeight: 100),

                            child: Padding(
                              //padding: const EdgeInsets.all(16),
                              padding: const EdgeInsets.only(top: 33),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'Won',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 76, 74, 74),
                                    ),
                                  ),
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 76, 74, 74),
                                    ),
                                  ),
                                  Text(
                                    'Lost',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 76, 74, 74),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Hangman Game',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            color: Color(0xffd04fea),
                          ),
                        ),
                        Text(
                          'Guess the word letter by letter',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 8,
                          margin: const EdgeInsets.all(30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                minHeight: 120, maxHeight: 200),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: currentWord.display
                                      .split(
                                          ' ') // display ya devuelve "a _ _ o"
                                      .map((char) => Text(
                                            char,
                                            style: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4c4a4a),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                // ancho disponible dentro de la card
                                final width = constraints.maxWidth;

                                // calculamos el tamaño de cada botón en base al ancho
                                final buttonSize = width < 500 ? 35.0 : 45.0;

                                return SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    alignment: WrapAlignment.center,
                                    children: 'abcdefghijklmnopqrstuvwxyz'
                                        .split('')
                                        .map((letter) {
                                      final alreadyGuessed = currentWord
                                          .lettersGuessed
                                          .contains(letter);
                                      return SizedBox(
                                        width: buttonSize,
                                        height: buttonSize,
                                        child: ElevatedButton(
                                          onPressed: alreadyGuessed
                                              ? null
                                              : () => onGuess(letter),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            letter,
                                            style: TextStyle(
                                              fontSize: buttonSize * 0.4,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        if (errorMessage != null)
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 6),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() => errorMessage = null);
                    },
                    child:
                        const Icon(Icons.close, color: Colors.white, size: 18),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
