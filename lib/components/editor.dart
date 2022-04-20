import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  const Editor({
    Key? key,
    required this.controller,
    required this.rotulo,
    required this.dica,
    this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 24),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        labelText: rotulo,
        hintText: dica,
      ),
    );
  }
}
