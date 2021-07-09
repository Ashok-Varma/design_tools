import 'package:design_tools/design_tools.dart';
import 'package:flutter/material.dart';

class DesignKeylinePainter extends CustomPainter {
  const DesignKeylinePainter({
    required this.keylines,
  });

  final List<Keyline> keylines;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint marginPaint = Paint();
    final Paint linePaint = Paint();

    for (final keyline in keylines) {
      final x = keyline.gravity == KeylineGravity.start
          ? keyline.xPos
          : size.width - keyline.xPos;

      // draw margin
      if (keyline.decorator.marginWidth != null) {
        final w = keyline.decorator.marginWidth!;
        final marginLine =
            keyline.gravity == KeylineGravity.start ? x - w / 2 : x + w / 2;
        marginPaint.strokeWidth = w;
        marginPaint.shader = _getShader(keyline, x, w, size);
        canvas.drawLine(Offset(marginLine, 0.0),
            Offset(marginLine, size.height), marginPaint);
      }

      if (keyline.decorator.lineWidth != null) {
        linePaint.strokeWidth = keyline.decorator.lineWidth!;
        linePaint.color = keyline.decorator.lineColor!;
        canvas.drawLine(Offset(x, 0.0), Offset(x, size.height), linePaint);
      }
    }
  }

  Shader _getShader(Keyline keyline, double x, double w, Size size) {
    final marginRect = keyline.gravity == KeylineGravity.start
        ? Rect.fromLTRB(x - w, 0, x, size.height)
        : Rect.fromLTRB(x, 0, x + w, size.height);
    return LinearGradient(
      colors: keyline.gravity == KeylineGravity.start
          ? [
              keyline.decorator.marginEndColor!,
              keyline.decorator.marginStartColor!
            ]
          : [
              keyline.decorator.marginStartColor!,
              keyline.decorator.marginEndColor!
            ],
    ).createShader(marginRect);
  }

  @override
  bool shouldRepaint(DesignKeylinePainter oldPainter) {
    return oldPainter.keylines != keylines;
  }

  @override
  bool hitTest(Offset position) => false;
}
