import 'package:cep/TelaCep.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CEP'),
        ),
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    _gerarInformacoes(String cep) async {
      Map<String, dynamic> informacoesCep;
      String url = 'https://viacep.com.br/ws/$cep/json/';
      http.Response response;
      response = await http.get(url);
      informacoesCep = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaCep(
              informacoesCep['cep'],
              informacoesCep['logradouro'],
              informacoesCep['bairro'],
              informacoesCep['localidade'],
              informacoesCep['uf']),
        ),
      );
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Digite o CEP',
              style: TextStyle(fontSize: 25),
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Digite o cep'),
            keyboardType: TextInputType.number,
            maxLength: 8,
            controller: _controller,
            onSubmitted: (_) {
              _gerarInformacoes(_controller.text);
            },
          ),
          RaisedButton(
            onPressed: () {
              _gerarInformacoes(_controller.text);
            },
            child: Text('Enviar'),
          )
        ],
      ),
    );
  }
}
