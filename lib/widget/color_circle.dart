import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  const ColorCircle({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: color,
          width: 7.0),
        shape: BoxShape.circle,
      ),
    );
  }
}
