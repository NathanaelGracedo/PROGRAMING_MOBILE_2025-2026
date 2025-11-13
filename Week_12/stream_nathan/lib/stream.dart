import 'package:flutter/material.dart';

class ColorStream {
  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }

  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.indigoAccent,
    Colors.lime,
  ];
}
