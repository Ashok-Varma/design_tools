import 'package:design_tools/design_tools.dart';
import 'package:flutter/material.dart';

class DesignGridPainter extends CustomPainter {
  const DesignGridPainter({
    required this.verticalInterval,
    required this.horizontalInterval,
  });

  final GridInterval verticalInterval;
  final GridInterval horizontalInterval;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint();

    final vDivisions = verticalInterval.divisions;
    const vSubdivisions = 1;
    final vInterval = verticalInterval.intervals;
    final vAllDivisions = (vDivisions * vSubdivisions).toDouble();

    for (double x = 0.0; x <= size.width; x += vInterval / vAllDivisions) {
      linePaint.strokeWidth = (x % vInterval == 0.0)
          ? verticalInterval.decoration.intervalWidth
          : (x % (vInterval / vSubdivisions) == 0.0)
              ? verticalInterval.decoration.divisionSeperatorWidth
              : verticalInterval.decoration.divisionSeperatorWidth;

      linePaint.color = (x % vInterval == 0.0)
          ? verticalInterval.decoration.intervalColor
          : (x % (vInterval / vSubdivisions) == 0.0)
              ? verticalInterval.decoration.divisionSeperatorColor
              : verticalInterval.decoration.divisionSeperatorColor;

      canvas.drawLine(Offset(x, 0.0), Offset(x, size.height), linePaint);
    }

    final hDivisions = horizontalInterval.divisions;
    const hSubdivisions = 1;
    final hInterval = horizontalInterval.intervals;
    final hAllDivisions = (hDivisions * hSubdivisions).toDouble();

    for (double y = 0.0; y <= size.height; y += hInterval / hAllDivisions) {
      linePaint.strokeWidth = (y % hInterval == 0.0)
          ? horizontalInterval.decoration.intervalWidth
          : (y % (hInterval / hSubdivisions) == 0.0)
              ? horizontalInterval.decoration.divisionSeperatorWidth
              : horizontalInterval.decoration.divisionSeperatorWidth;
      linePaint.color = (y % hInterval == 0.0)
          ? horizontalInterval.decoration.intervalColor
          : (y % (hInterval / hSubdivisions) == 0.0)
              ? horizontalInterval.decoration.divisionSeperatorColor
              : horizontalInterval.decoration.divisionSeperatorColor;

      canvas.drawLine(Offset(0.0, y), Offset(size.width, y), linePaint);
    }
  }

  @override
  bool shouldRepaint(DesignGridPainter oldPainter) {
    return oldPainter.verticalInterval != verticalInterval ||
        oldPainter.horizontalInterval != horizontalInterval;
  }

  @override
  bool hitTest(Offset position) => false;
}
