import 'package:flutter/material.dart';
import 'CsQuiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComSci Quiz',
      home: ComSciQuiz(title: 'How much do you know ComSci?'),
    );
  }
}

class ComSciQuiz extends StatefulWidget {
  ComSciQuiz({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComSciQuizState createState() => _ComSciQuizState();
}

class _ComSciQuizState extends State<ComSciQuiz> {
  int questionIndex = 0;
  int choiceIndex = 0;
  int totalScore = 0;

  final _questions = const [
    {
      'questionText': "สาขาที่นักศึกษาชอบเรียน?",
      'choices': ["วิทยาการคอมพิวเตอร์", "Computer Science", "ComSci", "Cs"],
      'scores': [5, 5, 3, 2]
    },
    {
      'questionText': "ภาษาโปรแกรมที่นักศึกษาชอบ?",
      'choices': ["HTML", "C++", "SQL", "Java"],
      'scores': [1, 2, 3, 5]
    },
    {
      'questionText': "วิชาที่คิดว่ายากที่สุด?",
      'choices': ["แคลคูลัส", "Flutter", "โครงสร้างข้อมูล", "โครงสร้างดิสครีต"],
      'scores': [5, 4, 3, 5]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      questionIndex = questionIndex + 1;
      totalScore = totalScore + score;
      // if (questionIndex >= _questions.length) {
      //   questionIndex = 0;
      //   totalScore = 0;
      //}
      print("Question : $questionIndex");
      print("Score : $totalScore");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (questionIndex < _questions.length)
            ? CsQuiz(_questions, questionIndex, _answerQuestion)
            : Text(
                "Your Score $totalScore",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.amber[800],
                ),
              ),
      ),
    );
  }
}
