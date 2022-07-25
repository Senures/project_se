import 'package:flutter/material.dart';
import 'package:se_to_do/core/style/colors.dart';


class AuthTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  AuthTextField(
      {Key? key,
      required this.controller,
      required this.title,
      required this.validator,
      required this.hintText,
      this.suffixIcon,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 19.0, fontWeight: FontWeight.bold, color: kTextColor),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText ?? false,
          controller: controller,
          cursorColor: kTextColor,
          decoration: InputDecoration(
              hintText: hintText, suffixIcon: suffixIcon ?? SizedBox()),
          validator: validator,
        ),
      ],
    );
  }
}
