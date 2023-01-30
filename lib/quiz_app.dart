import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual o ano de fundação do clube?',
      'respostas': [
        {'texto': '1869', 'pontuaçao': 0},
        {'texto': '1886', 'pontuaçao': 1},
        {'texto': '1902', 'pontuaçao': 0},
        {'texto': '1997', 'pontuaçao': 0},
      ],
    },
    {
      'texto': 'Qual maior artilheiro da história do clube?',
      'respostas': [
        {'texto': 'Robin Van Persie', 'pontuaçao': 0},
        {'texto': 'Ian Wright', 'pontuaçao': 0},
        {'texto': 'Thierry Henry', 'pontuaçao': 1},
        {'texto': 'Aubameyang', 'pontuaçao': 0},
      ],
    },
    {
      'texto': 'Em qual temporada o clube foi campeão invicto da Premier League?',
      'respostas': [
        {'texto': '01/02', 'pontuaçao': 0},
        {'texto': '05/06', 'pontuaçao': 0},
        {'texto': '03/04', 'pontuaçao': 1},
        {'texto': '99/00', 'pontuaçao': 0},
      ],
    },
    {
      'texto': 'Em 2012, para qual desses rivais o atacante RVP se transferiu?',
      'respostas': [
        {'texto': 'Liverpool', 'pontuaçao': 0},
        {'texto': 'Tottenham', 'pontuaçao': 0},
        {'texto': 'Chelsea', 'pontuaçao': 0},
        {'texto': 'Manchester United', 'pontuaçao': 1},
      ],
    },
    {
      'texto': 'Qual era o apelido do clube antes da chegada de Arsene Wenger?',
      'respostas': [
        {'texto': 'Boring Arsenal', 'pontuaçao': 1},
        {'texto': 'Invicibles', 'pontuaçao': 0},
        {'texto': 'Unstopabble Arsenal', 'pontuaçao': 0},
        {'texto': 'Big Arsenal', 'pontuaçao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario(String retorno) {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
      return _perguntaSelecionada < _perguntas.length;
    }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Quiz for Arsenal fans'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
            perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
