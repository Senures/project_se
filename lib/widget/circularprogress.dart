import 'package:flutter/material.dart';

class Circular extends StatelessWidget {
  const Circular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
      
        backgroundColor: Color(0xff6807F9)),
    );
  }
}
