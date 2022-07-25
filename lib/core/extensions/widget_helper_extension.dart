import 'package:flutter/material.dart';

extension WidgetHelperExtension on Widget {
  InkWell onTapWidget(Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  get center => Center(child: this);

  Padding paddingSymmetric({double? horizontal, double? vertical}) {
    return Padding(
        child: this,
        padding: EdgeInsets.symmetric(
            //kullanıcı değer girmediyse 0 verir
            horizontal: horizontal ?? 0,
            vertical: vertical ?? 0));
  }

  Padding paddingOnly(
      {double? top, double? bottom, double? left, double? right}) {
    return Padding(
      child: this,
      padding: EdgeInsets.only(
        bottom: bottom ?? 0,
        top: top ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
    );
  }

  Padding paddingAll({required double padding}) {
    return Padding(
      child: this,
      padding: EdgeInsets.all(padding),
    );
  }
}
