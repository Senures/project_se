import 'package:flutter/material.dart';

class RootButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final Color color;

  const RootButton(
      {Key? key, required this.ontap, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          primary: color,
          alignment: Alignment.center,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          minimumSize: Size(size.width, 45.0), //////// HERE
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}
