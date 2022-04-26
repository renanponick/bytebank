import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferencia';
const _labelValor = 'Valor';
const _labelConta = 'Nº Conta';
const _tipValor = '0000';
const _tipConta = '0000';
const _textButtonSend = 'Confirmar';

class FormTransfer extends StatefulWidget {
  FormTransfer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}

class FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerCampoConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: _controllerCampoConta,
                label: _labelConta,
                tip: _tipConta,
              ),
              Editor(
                controller: _controllerCampoValor,
                label: _labelValor,
                tip: _tipValor,
                icon: Icons.monetization_on,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _addTransfer(context),
                  child: Text(_textButtonSend),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTransfer(context) {
    final valor = double.tryParse(_controllerCampoValor.text);
    final conta = int.tryParse(_controllerCampoConta.text);
    if (valor != null && conta != null) {
      final createdTransfer = Transfer(valor, conta);
      Navigator.pop(context, createdTransfer);
    }
  }
}
