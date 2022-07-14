import 'package:flutter/material.dart';
import 'package:se_to_do/utils/const.dart';

// ignore: must_be_immutable
class DialogTextForm extends StatelessWidget {
  TextEditingController? controller;
  int? maxLength;
  
  DialogTextForm(this.controller, {Key? key, this.maxLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
   
      maxLength: 15,
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
