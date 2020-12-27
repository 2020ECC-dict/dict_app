import 'package:flutter/material.dart';
import 'searchpage.dart';
import 'wordbookpage.dart';
import 'quiz_mainpage.dart';
import 'progresspage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF026A4F),
            title: Text("App name"),
          ),
          bottomNavigationBar: menu(),// positioned the Tabs at the bottom of the screen
          body: TabBarView(
            children: [
              SearchPage(),
              WordBookPage(),
              QuizMainPage(),
              ProgressPage(),
            ],
          ),
        ),
      ),
    );
  }
}
Widget menu() {
  return Container(
    color: Color(0xff026A4F),
    child: TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.lightGreen,
      tabs: [
        Tab(
          text: "Search",
          icon: Icon(Icons.search),
        ),
        Tab(
          text: "Words",
          icon: Icon(Icons.folder),
        ),
        Tab(
          text: "Quiz",
          icon: Icon(Icons.tag_faces),
        ),
        Tab(
          text: "Progress",
          icon: Icon(Icons.outlined_flag),
        ),
      ],
    ),
  );
}
