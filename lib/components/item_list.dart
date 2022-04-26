import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;

  const Item({
    Key? key,
    this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon != null ? Icon(icon) : null,
        title: (Text(title)),
        subtitle: (Text(subtitle)),
      ),
    );
  }
}
