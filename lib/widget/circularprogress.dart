import 'package:flutter/material.dart';
import 'package:se_to_do/core/style/colors.dart';


class LoadingCircular extends StatelessWidget {
  const LoadingCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 5.0,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
