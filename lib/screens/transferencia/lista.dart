import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

class Listagem extends StatefulWidget {
  final List<Transfer> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transfer = widget._transferencias[indice];
          return Item(transfer: transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransf();
          })).then((transfer) {
            // Testar tempo de delay
            Future.delayed(Duration(seconds: 0), () {
              _atualiza(transfer);
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transfer? transfer) {
    if (transfer != null) {
      setState(() {
        widget._transferencias.add(transfer);
      });
    }
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
