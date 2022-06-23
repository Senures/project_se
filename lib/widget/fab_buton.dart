import 'package:flutter/material.dart';


// ignore: must_be_immutable
class FabButton extends StatelessWidget {
  final VoidCallback function;
  IconData icon;
  Color color;

  FabButton(this.function, this.icon,this.color, {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
   
        backgroundColor:color,
        child: Icon(
          icon,
          size: 25.0,
        ),
        onPressed: function);
  }
}
