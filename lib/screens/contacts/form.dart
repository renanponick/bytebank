import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Criando Contato';
const _labelName = 'Nome';
const _tipName = 'João Silva';
const _labelNumber = 'Nº Conta';
const _tipNumber = '0000';

const _textButtonSend = 'Confirmar';

class FormContact extends StatefulWidget {
  FormContact({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormContactState();
  }
}

class FormContactState extends State<FormContact> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: _controllerName,
                label: _labelName,
                tip: _tipName,
              ),
              Editor(
                controller: _controllerNumber,
                label: _labelNumber,
                tip: _tipNumber,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _addContact(context),
                  child: Text(_textButtonSend),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addContact(context) {
    final nome = _controllerName.text;
    final number = int.tryParse(_controllerNumber.text);
    if (nome != null && number != null) {
      final createdContact = Contact(nome, number);
      Navigator.pop(context, createdContact);
    }
  }
}
