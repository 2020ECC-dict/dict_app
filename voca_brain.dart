import 'dart:math';
import 'Vocabulary.dart';

class vocaBrain {
  List<Vocabulary> _vocaList = [
    Vocabulary(eng: 'apple', kor: '사과'),
    Vocabulary(eng: 'car', kor: '자동차'),
    Vocabulary(eng: 'see', kor: '보다')
  ];

  List numList() {
    List<int> vocaNums = List<int>(_vocaList.length);
    for (int i = 0; i < _vocaList.length; i++) {
      vocaNums[i] = Random().nextInt(_vocaList.length);
      for (int j = 0; j < i; j++) {
        if (vocaNums[i] == vocaNums[j]) {
          i--;
        }
      }
    }
    return vocaNums;
  }

  int quizNumber = 0;
  int oxNumber = 0;

  String getRandomVoca(List<int> nums, int i) {
    //int num = Random().nextInt(2);
    //if (num == 0) {
    //  return _vocaList[nums[i]].eng;
    //} else if (num == 1) {
    return _vocaList[nums[i]].kor;
    //}
  }

  String answerVoca(List<int> nums, int i) {
    return _vocaList[nums[i]].eng;
  }

  void nextQuiz() {
    if (quizNumber < _vocaList.length - 1) {
      quizNumber++;
    }
  }

  void nextOX() {
    if (oxNumber < _vocaList.length - 1) {
      oxNumber++;
    }
  }

  bool isFinished() {
    if (quizNumber >= _vocaList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool oxFinished() {
    if (oxNumber >= _vocaList.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
