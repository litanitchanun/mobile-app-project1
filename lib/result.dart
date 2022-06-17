import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            result.ceil().toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
