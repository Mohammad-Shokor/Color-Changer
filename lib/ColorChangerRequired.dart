import 'dart:math';

import 'package:flutter/material.dart';

class Colorchangerrequired extends StatefulWidget {
  const Colorchangerrequired({super.key});

  @override
  State<Colorchangerrequired> createState() => _ColorchangerrequiredState();
}

class _ColorchangerrequiredState extends State<Colorchangerrequired> {
  // This is boring version :(
  Color? color = Color.fromRGBO(15, 59, 153, 1);
  var begin = Alignment.topCenter;
  var end = Alignment.bottomCenter;
  List<Alignment> alignmentBegin = [
    Alignment.centerLeft,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.bottomLeft,
  ];
  List<Alignment> alignmentEnd = [
    Alignment.centerRight,
    Alignment.bottomCenter,
    Alignment.bottomRight,
    Alignment.topRight,
  ];
  List<String> aligmentDirection = [
    "Vertical",
    "Horizental",
    "Left-Right",
    "Right-Left",
  ];
  int? r = 15;
  int? g = 59;
  int? b = 153;
  double? o;
  String? direction = "Horizental";
  void changeColor() {
    setState(() {
      var temp = Random();
      r = temp.nextInt(256);
      g = temp.nextInt(256);
      b = temp.nextInt(256);
      o = (0.5 * temp.nextDouble()) + 0.5;
      color = Color.fromRGBO(r!, g!, b!, o!);
    });
  }

  void directionTwister() {
    setState(() {
      int temp = Random().nextInt(4);

      begin = alignmentBegin[temp];
      end = alignmentEnd[temp];
      direction = aligmentDirection[temp];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color!, Colors.white, color!],
            begin: begin,
            end: end,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  changeColor();
                },
                child: Text(
                  "ChangeColor",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Text("Red: $r  Green: $g  Blue: $b"),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  directionTwister();
                },
                child: Text(
                  "Change Direction",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Text("Direction: $direction"),
            ],
          ),
        ),
      ),
    ); // yes I write comments, I don't know why but it makes everything clear
  }
}
