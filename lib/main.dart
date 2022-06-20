import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var notaTotal = 0;
  final perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Celho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elevante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é a sua serie favorita?',
      'respostas': [
        {'texto': 'Suits', 'nota': 10},
        {'texto': 'Game of Thrones', 'nota': 5},
        {'texto': 'Breaking Bad', 'nota': 3},
        {'texto': 'Peaky Blinders', 'nota': 1},
      ]
    }
  ];

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        notaTotal += pontuacao;
      });
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      notaTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: perguntaSelecionada,
                perguntas: perguntas,
                quantoResponder: responder)
            : Resultado(notaTotal, reiniciarQuestionario),
      ),
    );
  }
}
