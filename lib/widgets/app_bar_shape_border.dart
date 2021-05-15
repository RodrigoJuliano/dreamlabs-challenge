import 'package:flutter/material.dart';

class AppBarShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();

    path.lineTo(0, rect.height + 16);
    path.quadraticBezierTo(4, rect.height, 16, rect.height);
    path.lineTo(rect.width - 16, rect.height);
    path.quadraticBezierTo(
        rect.width - 4, rect.height, rect.width, rect.height + 16);
    path.lineTo(rect.width, 0);
    path.close();

    return path;
  }
}
