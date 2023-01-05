import 'dart:math';

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
  List _numberQuestions = _randomNumberList();
  int _score = 0;
  int i = 0;

  // ignore: prefer_final_fields
  static List<Map<String, Object>> _questions = [
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
    {
      'questionText': 'Em que lugar vivem mais cangurus do que pessoas?',
      'answers': [
        {'text': 'Austrália', 'score': 1},
        {'text': 'Indonésia', 'score': 0},
        {'text': 'Nova Zelândia', 'score': 0},
        {'text': 'Papua-Nova Guiné', 'score': 0},
        {'text': 'África do Sul', 'score': 0},
      ],
    },
    {
      'questionText': 'Quantos braços tem um polvo?',
      'answers': [
        {'text': 'Seis', 'score': 0},
        {'text': 'Dez', 'score': 0},
        {'text': 'Sete', 'score': 0},
        {'text': 'Três', 'score': 0},
        {'text': 'Oito', 'score': 1},
      ],
    },
    {
      'questionText': 'Nesses pares, ambos são mamíferos:',
      'answers': [
        {'text': 'Baleia azul e golfinhos', 'score': 1},
        {'text': 'Morcegos e galinhas', 'score': 0},
        {'text': 'Girafas e tartarugas', 'score': 0},
        {'text': 'Porcos e pinguins', 'score': 0},
        {'text': 'Macacos e sapos', 'score': 0},
      ],
    },
    {
      'questionText': 'De que são constituídos os diamantes?',
      'answers': [
        {'text': 'Carbono', 'score': 1},
        {'text': 'Grafite', 'score': 0},
        {'text': 'Rênio', 'score': 0},
        {'text': 'Ósmio', 'score': 0},
        {'text': 'Bóhrio', 'score': 0},
      ],
    },
    {
      'questionText':
          'Qual desses autores brasileiros escreveu O Guarani e O Gaúcho?',
      'answers': [
        {'text': 'Aluísio de Azevedo', 'score': 0},
        {'text': 'José de Anchieta', 'score': 0},
        {'text': 'José de Alencar', 'score': 1},
        {'text': 'Gonçalves Dias', 'score': 0},
        {'text': 'Gonçalves de Magalhães', 'score': 0},
      ],
    },
    {
      'questionText': 'O etanol é produzido através de qual fonte de energia?',
      'answers': [
        {'text': 'Solar', 'score': 0},
        {'text': 'Biomassa', 'score': 1},
        {'text': 'Eólica', 'score': 0},
        {'text': 'Geotérmica', 'score': 0},
        {'text': 'Hidrelétrica', 'score': 0},
      ],
    },
    {
      'questionText':
          'Qual destas, apesar do seu nome, não é considerada um tipo de força?',
      'answers': [
        {'text': 'Força de atrito', 'score': 0},
        {'text': 'Força peso', 'score': 0},
        {'text': 'Força centrípeta', 'score': 0},
        {'text': 'Força eletromotriz', 'score': 1},
        {'text': 'Força normal', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses não é um instrumento meteorológico?',
      'answers': [
        {'text': 'Barógrafo', 'score': 0},
        {'text': 'Termômetro', 'score': 0},
        {'text': 'Pluviômetro', 'score': 0},
        {'text': 'Anemômetro', 'score': 0},
        {'text': 'Etilômetro', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual desses não é um instrumento meteorológico?',
      'answers': [
        {'text': 'Michelangelo', 'score': 0},
        {'text': 'Donatello', 'score': 0},
        {'text': 'William Shakespeare', 'score': 0},
        {'text': 'Leonardo da Vinc', 'score': 1},
        {'text': 'Van Gogh', 'score': 0},
      ],
    },
    // more questions...
  ];

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      i++;
    });
  }

  static List<int> _randomNumberList() {
    List<int> numberList = [];
    Random randomizer = new Random();
    while (numberList.length < 6) {
      int random_number = randomizer.nextInt(_questions.length);
      if (!numberList.contains(random_number)) {
        numberList.add(random_number);
      }
    }
    return numberList;
  }

  void _resetQuiz() {
    setState(() {
      _numberQuestions = _randomNumberList();
      _score = 0;
      i = 0;
      _numberQuestions.elementAt(i);
      print(_score);
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
        body: i < 5
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Question(
                      _questions[_numberQuestions.elementAt(i)]['questionText']
                          .toString(),
                    ),
                    ...(_questions[_numberQuestions.elementAt(i)]['answers']
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
            : Result(_score, () => _resetQuiz),
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
            onPressed: () => {
              resetHandler,
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              )
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
