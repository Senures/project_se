import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/core/style/app_textstyle.dart';
import 'package:se_to_do/core/style/colors.dart';


snackBarCustom(BuildContext context, String text) {
  showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash.bar(
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          insetAnimationCurve: Curves.elasticInOut,

          insetAnimationDuration: const Duration(seconds: 3),
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          controller: controller,
          backgroundColor: kPrimaryColor,

          position: FlashPosition.bottom,

          borderRadius: BorderRadius.circular(5.0),
          forwardAnimationCurve: Curves.elasticInOut,

          //enableVerticalDrag: true,

          child: FlashBar(
            content: Text(
              text.toString(),
              style: ProjectTextStyles.sbStyle,
            ),
          ),
        );
      });
}
