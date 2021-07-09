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
      final w = keyline.decorator.marginWidth;

      // draw margin
      final marginRect = keyline.gravity == KeylineGravity.start
          ? Rect.fromLTRB(x + w, 0, x, size.height)
          : Rect.fromLTRB(x, 0, x + w, size.height);
      final marginLine =
          keyline.gravity == KeylineGravity.start ? x - w / 2 : x + w / 2;
      marginPaint.strokeWidth = w;
      marginPaint.shader = LinearGradient(
        colors: [
          keyline.decorator.marginStartColor,
          keyline.decorator.marginEndColor,
        ],
      ).createShader(marginRect);
      canvas.drawLine(Offset(marginLine, 0.0), Offset(marginLine, size.height),
          marginPaint);

      linePaint.strokeWidth = keyline.decorator.lineWidth;
      linePaint.color = keyline.decorator.lineColor;
      canvas.drawLine(Offset(x, 0.0), Offset(x, size.height), linePaint);
    }
  }

  @override
  bool shouldRepaint(DesignKeylinePainter oldPainter) {
    return oldPainter.keylines != keylines;
  }

  @override
  bool hitTest(Offset position) => false;
}
