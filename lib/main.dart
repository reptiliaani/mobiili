import 'package:flutter/material.dart';
import 'package:index_calculator/index_calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painoindeksi laskuri',
      theme: ThemeData.dark(),
      home: IndexCalc(),
    );
  }
}

