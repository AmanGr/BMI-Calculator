import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff13141D),
        scaffoldBackgroundColor: Color(0xff13141D),
        accentColor: Colors.blue,
      ),
      home: InputPage(),
    );
  }
}
