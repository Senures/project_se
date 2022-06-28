import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
      
        backgroundColor: Color(0xff6807F9)),
    );
  }
}
