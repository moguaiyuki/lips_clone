// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lips_clone/utils/styles/styles.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final Rect rect =
        Offset(offset.dx, (configuration.size.height / 2) - 30 / 2) &
            Size(configuration.size.width, 30);
    final Paint paint = Paint();
    paint.color = LipsColors.main;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(15.0)),
      paint,
    );
  }
}
