import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  get height => MediaQuery.of(this).size.height;
  get width => MediaQuery.of(this).size.width;

  toPage(Widget page) => Navigator.push(
        this,
        MaterialPageRoute<void>(
          builder: (_) => page,
        ),
      );

  toPageReplacement(Widget page) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  toPageBack() => Navigator.pop(this);

  toPushAndRemove(Widget page) => Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute<void>(builder: (BuildContext context) => page),
        ModalRoute.withName('/'),
      );
}
