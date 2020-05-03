// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lips_clone/utils/styles/styles.dart';

class LipsTabIndicator extends Decoration {
  final double xOffset;

  LipsTabIndicator({this.xOffset = 0});

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _LipsPainter(this, onChanged, xOffset);
  }
}

class _LipsPainter extends BoxPainter {
  final LipsTabIndicator decoration;
  final double xOffset;

  _LipsPainter(this.decoration, VoidCallback onChanged, [this.xOffset = 0])
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final Rect rect =
        Offset(offset.dx + xOffset, (configuration.size.height / 2) - 30 / 2) &
            Size(configuration.size.width - (xOffset * 2), 30);
    final Paint paint = Paint();
    paint.color = LipsColors.brand;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(15.0)),
      paint,
    );
  }
}
