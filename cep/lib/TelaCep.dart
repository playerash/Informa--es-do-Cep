import 'package:flutter/material.dart';

class TelaCep extends StatelessWidget {
  String cep;
  String logradouro;
  String bairro;
  String cidade;
  String estado;
  TelaCep(this.cep,this.logradouro, this.bairro, this.cidade,this.estado);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Cep: ' + cep),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Rua: ' + logradouro),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Bairro: ' + bairro),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Cidade: ' + cidade),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Estado: ' + estado),
            ),
           
          ],
        ),
      ),
    );
  }
}
