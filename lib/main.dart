import 'package:bytebank/screens/dashboard.dart';
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
        primaryColor: Colors.red[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red[900],
          secondary: Colors.blue[700],
        ),
      ),
      home: const Dashboard(),
    );
  }
}
