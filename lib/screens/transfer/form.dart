import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Criando Transferencia';
const _labelValue = 'Valor';
const _labelAccount = 'Nº Conta';
const _tipValue = '0000';
const _tipAccount = '0000';
const _textButtonSend = 'Confirmar';

class FormTransfer extends StatefulWidget {
  const FormTransfer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}

class FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerCampoAccount = TextEditingController();
  final TextEditingController _controllerCampoValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titleAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: _controllerCampoAccount,
                label: _labelAccount,
                tip: _tipAccount,
              ),
              Editor(
                controller: _controllerCampoValue,
                label: _labelValue,
                tip: _tipValue,
                icon: Icons.monetization_on,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _addTransfer(context),
                  child: const Text(_textButtonSend),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTransfer(context) {
    final value = double.tryParse(_controllerCampoValue.text);
    final account = int.tryParse(_controllerCampoAccount.text);
    if (value != null && account != null) {
      final createdTransfer = Transfer(0, value, account);
      Navigator.pop(context, createdTransfer);
    }
  }
}
