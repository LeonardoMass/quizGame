import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'O que a palavra legend significa em português?',
      'answers': [
        {'text': 'Legenda', 'score': 0},
        {'text': 'Conto', 'score': 0},
        {'text': 'História', 'score': 0},
        {'text': 'Lenda', 'score': 1},
        {'text': 'Legendário', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual o maior planeta do sistema solar?',
      'answers': [
        {'text': 'Marte', 'score': 0},
        {'text': 'Lua', 'score': 0},
        {'text': 'Saturno', 'score': 0},
        {'text': 'Terra', 'score': 0},
        {'text': 'Júpiter', 'score': 1},
      ],
    },
    {
      'questionText': 'Quais as duas línguas mais faladas no mundo?',
      'answers': [
        {'text': 'Inglês e espanhol', 'score': 0},
        {'text': 'Inglês e mandarim chinês', 'score': 1},
        {'text': 'Mandarim chinês e francês', 'score': 0},
        {'text': 'Inglês e português', 'score': 0},
        {'text': 'Inglês e espanhol', 'score': 0},
      ],
    },
    {
      'questionText':
          'Em que ano foi usado um celular pela primeira vez no Brasil?',
      'answers': [
        {'text': '1900', 'score': 0},
        {'text': '1990', 'score': 1},
        {'text': '1890', 'score': 0},
        {'text': '2000', 'score': 0},
        {'text': '2020', 'score': 0},
      ],
    },
    {
      'questionText': 'Que fruto nasce da oliveira?',
      'answers': [
        {'text': 'Amêndoa', 'score': 0},
        {'text': 'Abacate', 'score': 0},
        {'text': 'Azeitona', 'score': 1},
        {'text': 'Açaí', 'score': 0},
        {'text': 'Acerola', 'score': 0},
      ],
    },
    // more questions...
  ];

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      _currentQuestionIndex = _currentQuestionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      HomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(57, 62, 70, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 173, 181, 1),
          title: Center(child: Text('Quiz Game by Leonardo Massena')),
        ),
        body: _currentQuestionIndex < _questions.length
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Question(
                      _questions[_currentQuestionIndex]['questionText']
                          .toString(),
                    ),
                    ...(_questions[_currentQuestionIndex]['answers']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                        answer['text'].toString(),
                        () => _answerQuestion(
                            int.parse(answer['score'].toString())),
                      );
                    }).toList()
                  ],
                ),
              )
            : Result(_score, _resetQuiz),
      ),
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 30, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  Answer(this.answerText, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Color.fromRGBO(250, 250, 250, 1),
            primary: Color.fromRGBO(0, 173, 181, 1),
          ),
          child: Text(
            answerText,
            style: TextStyle(fontSize: 24),
          ),
          onPressed: onTap,
        ));
  }
}

class Result extends StatelessWidget {
  final int score;
  final void Function() resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;

    resultText = 'Você acertou $score de 5 perguntas!';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromRGBO(250, 250, 250, 1),
                primary: Color.fromRGBO(0, 173, 181, 1),
                padding: EdgeInsets.fromLTRB(60, 20, 60, 20)),
            child: Text(
              'Voltar para o início',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () {
              resetHandler;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        title: Center(child: Text('Quiz Game by Leonardo Massena')),
      ),
      backgroundColor: Color.fromRGBO(57, 62, 70, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromRGBO(250, 250, 250, 1),
                    primary: Color.fromRGBO(0, 173, 181, 1),
                    padding: const EdgeInsets.all(20.0)),
                child: Text(
                  'Começar',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
