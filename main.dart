import 'package:flutter/material.dart';
import 'package:voca_quiz/OX_quiz.dart';
import 'essay_quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VOCA QUIZ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ButtonTheme(
            minWidth: double.infinity,
            height: 80.0,
            padding: EdgeInsets.all(10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EssayQuiz()));
              },
              color: Colors.blue,
              child: Center(
                child: Text(
                  '주관식 퀴즈 풀기',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            minWidth: double.infinity,
            height: 80.0,
            padding: EdgeInsets.all(10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OXquiz()));
              },
              color: Colors.blue,
              child: Center(
                child: Text(
                  'O/X 퀴즈 풀기',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
