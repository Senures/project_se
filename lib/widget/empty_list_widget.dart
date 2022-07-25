import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';

class EmptyListWidget extends StatelessWidget {
  final String messsage;
  const EmptyListWidget({Key? key, required this.messsage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      messsage,
      style: TextStyle(
          color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.bold),
    ).center;
  }
}
