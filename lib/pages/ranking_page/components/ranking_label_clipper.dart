import 'package:flutter/material.dart';

class RankingLabelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    // Offset centerPoint = Offset(size.width / 2, size.height * 2 / 3);
    path.lineTo(size.width / 2, size.height * 3 / 4);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
