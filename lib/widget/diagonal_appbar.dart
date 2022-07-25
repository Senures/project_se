import 'package:flutter/material.dart';
import 'package:clippy_flutter/diagonal.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/style/colors.dart';


class DiagonalAppBar extends StatelessWidget {
  final double appBarheight;
  final double diagonalHeight;
  final Widget child;
  const DiagonalAppBar(
      {Key? key,
      required this.appBarheight,
      required this.child,
      required this.diagonalHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Diagonal(
      clipHeight: diagonalHeight,
      axis: Axis.horizontal,
      position: DiagonalPosition.BOTTOM_LEFT,
      child: Container(
          color: kSecondaryColor,
          width: context.width,
          height: appBarheight,
          child: child),
    );
  }
}
