import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/style/app_textstyle.dart';


snackBarCustom(BuildContext context, String text, Color color, int second) {
  showFlash(
      context: context,
      duration: Duration(seconds: second),
      builder: (context, controller) {
        return Flash.bar(
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          insetAnimationCurve: Curves.elasticInOut,

          insetAnimationDuration: const Duration(seconds: 3),
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          controller: controller,
          backgroundColor: color,

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
