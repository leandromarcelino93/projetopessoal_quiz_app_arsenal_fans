import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.redAccent,
        ),
        onPressed: quandoSelecionado,
        child: Text(texto, style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}