import 'dart:math';

import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  // Welcome to cool version :)
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color? color = Color.fromRGBO(15, 59, 153, 1); // color of background gradient
  var begin = Alignment.topCenter; // the begin of gradient
  var end = Alignment.bottomCenter; // the end of gradient
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
  int? r = 15; // the red in rgb of color
  int? g = 59; // the green in rgb of color
  int? b = 153; // the blue in rgb of color
  double? o; // the opacity of color
  String? direction = "Horizental"; // the direction
  void changeColor() async {
    for (int i = 0; i < 4; i++) {
      // I added the for loop for animation-like transition
      setState(() {
        var temp = Random();
        r = temp.nextInt(256);
        g = temp.nextInt(256);
        b = temp.nextInt(256);
        o = (0.5 * temp.nextDouble()) + 0.5;
        color = Color.fromRGBO(r!, g!, b!, o!);
      });
      await Future.delayed(
        Duration(milliseconds: 400),
      ); // the delay between each color
    }
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: Text("You got the color \nRed: $r Green: $g Blue: $b"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  void directionTwister() async {
    for (int i = 0; i < 8; i++) {
      // added to create transition that look like animation
      setState(() {
        begin = alignmentBegin[i % 4];
        end = alignmentEnd[i % 4];
        direction = aligmentDirection[i % 4];
      });
      await Future.delayed(
        Duration(milliseconds: 200),
      ); // delay between each aligment
    }
    setState(() {
      int temp = Random().nextInt(4);

      begin = alignmentBegin[temp]; // final aligment begin
      end = alignmentEnd[temp]; // final aligment end
      direction =
          aligmentDirection[temp]; // the string that shows direction ( vertical, horizental , right to left, left to right)

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: Text("You got the aligment $direction"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Warning: Color Flash on button touch")),
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
                  style: TextStyle(color: Colors.black),
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
                  style: TextStyle(color: Colors.black),
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
