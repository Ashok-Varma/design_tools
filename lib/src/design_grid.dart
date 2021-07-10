import 'package:design_tools/design_tools.dart';
import 'package:flutter/material.dart';

class DesignGridPainter extends CustomPainter {
  const DesignGridPainter({
    required this.verticalInterval,
    required this.horizontalInterval,
  });

  final GuideInterval? verticalInterval;
  final GuideInterval? horizontalInterval;

  @override
  void paint(Canvas canvas, Size size) {
    if (verticalInterval != null) {
      _drawVerticalIntervals(verticalInterval!, canvas, size);
    }
    if (horizontalInterval != null) {
      _drawHorizontalIntervals(horizontalInterval!, canvas, size);
    }
  }

  @override
  bool shouldRepaint(DesignGridPainter oldPainter) {
    return oldPainter.verticalInterval != verticalInterval ||
        oldPainter.horizontalInterval != horizontalInterval;
  }

  @override
  bool hitTest(Offset position) => false;

  void _drawVerticalIntervals(
      GuideInterval verticalInterval, Canvas canvas, Size size) {
    final Paint linePaint = Paint();
    final vDivisions = verticalInterval.divisions;
    const vSubdivisions = 1;
    final vInterval = verticalInterval.intervals;
    final vAllDivisions = (vDivisions * vSubdivisions).toDouble();

    for (double x = 0.0; x <= size.width; x += vInterval / vAllDivisions) {
      linePaint.strokeWidth = (x % vInterval == 0.0)
          ? verticalInterval.intervalDecorator.width
          : (x % (vInterval / vSubdivisions) == 0.0)
              ? verticalInterval.divisionDecorator.width
              : verticalInterval.divisionDecorator.width;

      linePaint.color = (x % vInterval == 0.0)
          ? verticalInterval.intervalDecorator.color
          : (x % (vInterval / vSubdivisions) == 0.0)
              ? verticalInterval.divisionDecorator.color
              : verticalInterval.divisionDecorator.color;

      canvas.drawLine(Offset(x, 0.0), Offset(x, size.height), linePaint);
    }
  }

  void _drawHorizontalIntervals(
      GuideInterval horizontalInterval, Canvas canvas, Size size) {
    final Paint linePaint = Paint();
    final hDivisions = horizontalInterval.divisions;
    const hSubdivisions = 1;
    final hInterval = horizontalInterval.intervals;
    final hAllDivisions = (hDivisions * hSubdivisions).toDouble();

    for (double y = 0.0; y <= size.height; y += hInterval / hAllDivisions) {
      linePaint.strokeWidth = (y % hInterval == 0.0)
          ? horizontalInterval.intervalDecorator.width
          : (y % (hInterval / hSubdivisions) == 0.0)
              ? horizontalInterval.divisionDecorator.width
              : horizontalInterval.divisionDecorator.width;
      linePaint.color = (y % hInterval == 0.0)
          ? horizontalInterval.intervalDecorator.color
          : (y % (hInterval / hSubdivisions) == 0.0)
              ? horizontalInterval.divisionDecorator.color
              : horizontalInterval.divisionDecorator.color;

      canvas.drawLine(Offset(0.0, y), Offset(size.width, y), linePaint);
    }
  }
}
