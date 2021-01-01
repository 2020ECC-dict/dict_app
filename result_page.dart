import 'package:flutter/material.dart';
import 'essay_quiz.dart';
import 'main.dart';
import 'OX_quiz.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.num1, @required this.num2});

  final int num1;
  final int num2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VOCA QUIZ'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  '${num1} / ${num1 + num2}',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            ButtonTheme(
              minWidth: double.infinity,
              height: 80.0,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  correctNum = 0;
                  wrongNum = 0;
                  correctOX = 0;
                  wrongOX = 0;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '메인으로',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
