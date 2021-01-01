import 'package:flutter/material.dart';
import 'package:voca_quiz/result_page.dart';
import 'voca_brain.dart';

vocaBrain vb = vocaBrain();

List<int> vn = vb.numList();

int correctNum = 0;
int wrongNum = 0;

class EssayQuiz extends StatefulWidget {
  @override
  _EssayQuizState createState() => _EssayQuizState();
}

class _EssayQuizState extends State<EssayQuiz> {
  TextEditingController controller = TextEditingController();

  void checkAnswer(String answer) {
    setState(() {
      if (vb.isFinished() == true) {
        if (answer == vb.answerVoca(vn, vb.quizNumber)) {
          correctNum++;
          controller.clear();
        } else {
          wrongNum++;
          controller.clear();
        }
        vb.quizNumber = 0;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResultPage(num1: correctNum, num2: wrongNum)));
      } else {
        if (answer == vb.answerVoca(vn, vb.quizNumber)) {
          correctNum++;
          controller.clear();
        } else {
          wrongNum++;
          controller.clear();
        }
        vb.nextQuiz();
      }
    });
  }

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
                vb.getRandomVoca(vn, vb.quizNumber),
                style: TextStyle(fontSize: 60.0),
              ),
            ),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: '정답을 입력하세요.'),
          ),
          ButtonTheme(
            minWidth: double.infinity,
            height: 80.0,
            padding: EdgeInsets.all(10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              onPressed: () {
                checkAnswer(controller.text);
              },
              color: Colors.blue,
              child: Center(
                child: Text(
                  '다음 문제',
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
