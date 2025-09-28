import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f3e4),

      body: Center(
        child: SizedBox(
          width: 800,

          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [Text('Won'), Text('Total'), Text('Lost')],
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Card(
                margin: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Errors'),
                      Text('Correct'),
                      Text('Attempts'),
                    ],
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
