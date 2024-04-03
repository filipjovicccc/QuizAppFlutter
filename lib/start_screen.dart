import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});


  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 200
            , color: const Color.fromARGB(132, 255, 255, 255)),
           const SizedBox(height: 20),
           const Text(
              "Learn Flutter fun way",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
           const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed:  startQuiz,
              label: const Text("Start quiz"),
              icon: const Icon(Icons.arrow_right_alt),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black
              ),
            ),
          ],
        ),
      );
  }
}

