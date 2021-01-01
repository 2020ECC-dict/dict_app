import 'package:flutter/material.dart';
import 'result_page.dart';
import 'essay_quiz.dart';

List<int> engNum = vb.numList();
List<int> korNum = vb.numList();

int correctOX = 0;
int wrongOX = 0;

class OXquiz extends StatefulWidget {
  @override
  _OXquizState createState() => _OXquizState();
}

class _OXquizState extends State<OXquiz> {
  bool OXcorrect() {
    if (engNum[vb.oxNumber] == korNum[vb.oxNumber]) {
      return true;
    } else {
      return false;
    }
  }

  void checkO(bool result) {
    setState(() {
      if (vb.oxFinished() == true) {
        if (result == true) {
          correctOX++;
        } else {
          wrongOX++;
        }
        vb.oxNumber = 0;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResultPage(num1: correctOX, num2: wrongOX)));
      } else {
        if (result == true) {
          correctOX++;
        } else {
          wrongOX++;
        }
        vb.nextOX();
      }
    });
  }

  void checkX(bool result) {
    setState(() {
      if (vb.oxFinished() == true) {
        if (result == false) {
          correctOX++;
        } else {
          wrongOX++;
        }
        vb.oxNumber = 0;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResultPage(num1: correctOX, num2: wrongOX)));
      } else {
        if (result == false) {
          correctOX++;
        } else {
          wrongOX++;
        }
        vb.nextOX();
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
                vb.getRandomVoca(korNum, vb.oxNumber),
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                vb.answerVoca(engNum, vb.oxNumber),
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    checkO(OXcorrect());
                  },
                  child: Container(
                    child: Icon(Icons.panorama_fish_eye, size: 80.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    checkX(OXcorrect());
                  },
                  child: Container(
                    child: Icon(Icons.close, size: 80.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
