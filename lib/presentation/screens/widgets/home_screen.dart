import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f3e4),

      body: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 600,

          //podriamos probar con singlechildscrollview para tener scroll
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                'Guess de word letter by letter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
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
                    padding: const EdgeInsets.only(top: 33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Errors',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 76, 74, 74),
                          ),
                        ),
                        Text(
                          'Correct',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 76, 74, 74),
                          ),
                        ),
                        Text(
                          'Attempts',
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
              Card(
                elevation: 8,
                margin: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),

                child: ConstrainedBox(
                  //permite colocar un tamano minimo y max a la card
                  constraints: BoxConstraints(minHeight: 400, maxHeight: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
