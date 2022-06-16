/* import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
 // Widget? prefixIcon;
  final TextEditingController? controller;
   Function(String?)? validator;
  CustomTextForm({
    Key? key,

    required this.controller,
    required this.validator
  }) : super(key: key);
//required this.controller
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator:validator(val),
        cursorColor: Color.fromARGB(255, 241, 152, 152),
      
        //controller:controller ,
        decoration: InputDecoration(
        //  prefixIcon:prefixIcon ,
            border: InputBorder.none,
       
            // labelText: 'Enter something',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(

              borderSide: const BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
 */