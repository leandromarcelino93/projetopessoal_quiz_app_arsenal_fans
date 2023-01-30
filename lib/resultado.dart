import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function(String) quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao == 5) {
      return 'Você acertou as 5 perguntas, você é um Verdadeiro fã!';
    } else if (pontuacao == 4) {
      return 'Você acertou 4 perguntas, você é um Fã';
    } else if (pontuacao == 3) {
      return 'Você acertou 3 perguntas... Então vc até que gosta';
    } else if (pontuacao == 2){
      return 'Você acertou 2 perguntas, gosta um pouco...';
    } else if (pontuacao == 1){
      return 'Você acertou 1 pergunta...\n Não deve gostar muito...';
    }
    else {
      return 'Errou todas...\nAcho que vc torce pro Tottenham rs...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(textAlign: TextAlign.center,
            fraseResultado, style: const TextStyle(fontSize: 28),
          ),
          ElevatedButton(style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
              onPressed: () => quandoReiniciarQuestionario ('Retorno'),
              child: const Text(
                'Reiniciar?',
                style: TextStyle(fontSize: 24, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
