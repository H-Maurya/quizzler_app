import 'package:flutter/material.dart';
import 'brain.dart';

void main() {
  runApp(Quizzler());
}

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> score = [];

  void checkAnswers(bool userAnswer) {
    bool answer = quizBrain.getAnswer();
    setState(() {
      if (answer == userAnswer) {
        print('right');
        score.add(Icon(Icons.check, color: Colors.green));
      } else {
        print('wrong');
        score.add(Icon(Icons.close, color: Colors.red));
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 180, 10, 0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      quizBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Expanded(
                    child: Container(
                      width: 400,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[800],
                          ),
                          child: Text(
                            'True',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            checkAnswers(true);
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[800],
                        ),
                        onPressed: () {
                          checkAnswers(false);
                        },
                        child: Text(
                          'False',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(children: score),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
