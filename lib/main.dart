import 'package:colorchanger/ColorChangerCool.dart';
import 'package:colorchanger/ColorChangerRequired.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Colorchangerrequired(),
    ); // boring version, for cool one, change it to ColorChangerCool()
  }
}
