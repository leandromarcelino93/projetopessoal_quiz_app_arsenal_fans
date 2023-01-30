import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function (int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> respostas = temPerguntaSelecionada ?
    perguntas[perguntaSelecionada].cast()['respostas'] : [];
    /*tem pergunta selecionada? caso sim, coloque dentro da
    lista respostas, caso contrário, considere vazio.*/


    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),

        ...respostas.map((resp) {

          return Resposta(
            resp['texto'].toString(),
                () => quandoResponder(int.parse(resp['pontuaçao']!.toString())),
          );
        }).toList(),
      ],
    );
  }
}
