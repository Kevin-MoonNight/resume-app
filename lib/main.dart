import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    Center(child: ProfilePage()),
    Center(child: EducationPage()),
    Center(child: ExperiencePage()),
  ];

  final String title = 'NKUST_C109151104_鄭政文_MIDTERM';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Education',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Experience',
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String name = 'Cheng Cheng-Wen';
  final String email = 'k0937477331@gmail.com';
  final String description =
      "I'm Kevin, I've been studying programming since I was in high school, and I've participated some programming competitions and gotten some good results.";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(email,
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  final String title = 'Education';
  final String education =
      'National Kaohsiung University of Science and Technology';
  final String major =
      'Department of Computer Science & Information Engineering';
  final String year = '2020 - 2024';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: Colors.black),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(education,
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Text(major,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(year,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  ExperiencePage({super.key});

  final String title = 'Work Experiences';
  final List<Experience> experiences = [
    Experience(
        '實用技能學程現況調查系統',
        '此系統是提供全台灣所有高中職來統計實用技能學程的概況，我負責程式開發、設計資料表跟程式架構、重構程式，以及負責Code Review跟制定Coding Style，並且引入了Git來幫團隊做版本控制 ，我是在系統要DEMO前一個多禮拜加入開發團隊的，在此之前我沒有任何使用過ASP.NET Core的經驗，我只花了2天熟讀Docs，就馬上投入開發，並且使用了1個禮拜就將近40%的功能給做完了，之後我再花了1個禮拜將舊有的資料表重新設計以及在程式架構裡善用OOP，讓程式碼比起原先減少了超過50%。',
        'LabProject',
        'Sep 2022 -  Oct 2022',
        ['C#', 'ASP.NET Core MVC', 'Bootstrap', 'MySQL']),
    Experience('演算法程式開發', '透過多種策略的演算法，計算績效表現 ，讓使用者可以在不同的情況下，選擇出績效最好的策略。',
        'Piecework', 'Mar 2021 -  Jun 2021', ['C#']),
  ];

  Widget getTitle() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(title,
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              backgroundColor: Colors.black),
          textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getTitle(),
          for (var experience in experiences) experience.getWidget()
        ],
      ),
    );
  }
}

class Experience {
  String title;
  String description;
  String type;
  String date;
  List<String> skills;

  Experience(this.title, this.description, this.type, this.date, this.skills);

  Widget getWidget() {
    return Column(
      children: [
        _getTitleWidget(),
        _getTypeWidget(),
        _getSkillsWidget(),
        _getDateWidget(),
        _getDescriptionWidget(),
        Divider(
          color: Colors.black,
          height: 30,
        ),
      ],
    );
  }

  Widget _getTitleWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text(title,
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
    );
  }

  Widget _getDescriptionWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text(description,
          style: TextStyle(fontSize: 16, color: Colors.black87),
          textAlign: TextAlign.center),
    );
  }

  Widget _getTypeWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text(type,
          style: TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center),
    );
  }

  Widget _getDateWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text(date,
          style: TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center),
    );
  }

  Widget _getSkillsWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text('(' + skills.join('/') + ')',
          style: TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center),
    );
  }
}
