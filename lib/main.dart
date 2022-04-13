// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: List(),
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Item(transfer: Transfer(110.0, 1000)),
        Item(transfer: Transfer(110.0, 1000)),
        Item(transfer: Transfer(120.0, 1000)),
      ],
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
}
