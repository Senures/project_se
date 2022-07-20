import 'package:flutter/material.dart';
import 'package:se_to_do/style/colors.dart';


// ignore: must_be_immutable
class DialogTextForm extends StatelessWidget {
  TextEditingController? controller;
  int? maxLength;
  
  DialogTextForm(this.controller,  {this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
   
      maxLength: maxLength,
      controller: controller,
      cursorColor: kTextColor,
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color:kBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: kTextColor),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
