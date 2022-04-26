import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  const Editor({
    Key? key,
    required this.controller,
    required this.label,
    required this.tip,
    this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 24),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        labelText: label,
        hintText: tip,
      ),
    );
  }
}
