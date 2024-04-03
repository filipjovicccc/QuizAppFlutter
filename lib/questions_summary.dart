import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';



class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({Key? key, required this.summaryData}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final index = (data['question_index'] as int) + 1;
              final color = _generateRandomColor(); // Generate a random color

              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 20, // Adjust as needed
                      height: 20, // Adjust as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(color: Colors.green, fontSize: 12),
                        ),
                        Text(
                          data['user_answer'] as String, // Is this intentional?
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ), // Closing parenthesis was missing here
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}