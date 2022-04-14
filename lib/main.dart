// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: FormTransf(),
      ),
    );
  }
}

class FormTransf extends StatelessWidget {
  FormTransf({Key? key}) : super(key: key);

  final TextEditingController _controllerCampoConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controllerCampoConta,
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
            ),
            TextFormField(
              controller: _controllerCampoValor,
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0,00',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final valor = double.tryParse(_controllerCampoValor.text);
                final conta = int.tryParse(_controllerCampoConta.text);
                if (valor != null && conta != null) {
                  final createdTransfer = Transfer(valor, conta);
                  print(createdTransfer);
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Aula 1

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          Item(transfer: Transfer(110.0, 1000)),
          Item(transfer: Transfer(110.0, 1000)),
          Item(transfer: Transfer(120.0, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Transfer transfer;

  const Item({
    required this.transfer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: (Text(transfer.valor.toString())),
        subtitle: (Text(transfer.conta.toString())),
      ),
    );
  }
}

class Transfer {
  final double valor;
  final int conta;

  Transfer(this.valor, this.conta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, conta $conta}';
  }
}
