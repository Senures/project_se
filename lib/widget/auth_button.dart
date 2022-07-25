import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';
import 'package:se_to_do/core/style/app_textstyle.dart';
import 'package:se_to_do/core/style/colors.dart';


class AuthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonLabel;
  const AuthButton(
      {Key? key, required this.onPressed, required this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: kSecondaryColor,
        alignment: Alignment.center,
        elevation: 10,
        shadowColor: Colors.grey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        minimumSize: Size(context.width * 0.6, context.height * 0.06),
      ),
      child: Text(
        buttonLabel,
        style: ProjectTextStyles.sign,
      ),
    ).paddingOnly(bottom: 15, top: 15).center;
  }
}
