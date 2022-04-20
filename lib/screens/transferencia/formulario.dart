import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferencia';
const _rotuloCampoValor = 'Valor';
const _rotuloCampoConta = 'Nº Conta';
const _dicaCampoValor = '0000';
const _dicaCampoConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormTransf extends StatefulWidget {
  FormTransf({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormTransf> {
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
                rotulo: _rotuloCampoConta,
                dica: _dicaCampoConta,
              ),
              Editor(
                controller: _controllerCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _criarTransferencia(context),
                child: Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _criarTransferencia(context) {
    final valor = double.tryParse(_controllerCampoValor.text);
    final conta = int.tryParse(_controllerCampoConta.text);
    if (valor != null && conta != null) {
      final createdTransfer = Transfer(valor, conta);
      Navigator.pop(context, createdTransfer);
    }
  }
}
