import 'package:flutter/material.dart';

class GridInterval {
  /// The distance between the primary lines in the grid, in logical pixels.
  final int intervals;

  /// The number of major divisions within each primary grid cell.
  /// This is the number of major divisions per [interval], including the
  /// primary grid's line.
  ///
  /// If this is set to 2, then for each [interval] there will be two divisions
  /// separated by a line
  final int divisions;
  final GridIntervalDecoration decoration;

  const GridInterval(
    this.intervals, {
    this.divisions = 1,
    this.decoration = const GridIntervalDecoration(),
  }) : assert(divisions > 0,
            'The "divisions" property must be greater than zero. If there were no divisions, the grid paper would not paint anything.');

  @override
  bool operator ==(Object other) =>
      other is GridInterval &&
      other.intervals == intervals &&
      other.decoration == decoration &&
      other.divisions == divisions;

  @override
  int get hashCode => hashValues(intervals, decoration, divisions);
}

class GridIntervalDecoration {
  final Color intervalColor;
  final Color divisionSeperatorColor;
  final double intervalWidth;
  final double divisionSeperatorWidth;

  const GridIntervalDecoration({
    this.intervalColor = const Color(0x7FC3E8F3),
    this.divisionSeperatorColor = const Color(0x7FC3E8F3),
    this.intervalWidth = 0.5,
    this.divisionSeperatorWidth = 0.25,
  });

  @override
  bool operator ==(Object other) =>
      other is GridIntervalDecoration &&
      other.intervalColor == intervalColor &&
      other.divisionSeperatorColor == divisionSeperatorColor &&
      other.intervalWidth == intervalWidth &&
      other.divisionSeperatorWidth == divisionSeperatorWidth;

  @override
  int get hashCode => hashValues(intervalColor, divisionSeperatorColor,
      intervalWidth, divisionSeperatorWidth);
}

class Keyline {
  final double xPos;
  final KeylineGravity gravity;
  final KeylineDecorator decorator;
  const Keyline(
    this.xPos, {
    this.gravity = KeylineGravity.start,
    this.decorator = const KeylineDecorator(),
  });
}

enum KeylineGravity { start, end }

class KeylineDecorator {
  final double lineWidth;
  final Color lineColor;
  final double marginWidth;
  final Color marginStartColor;
  final Color marginEndColor;
  const KeylineDecorator({
    this.lineWidth = 1,
    this.lineColor = const Color(0xFFEC018C),
    this.marginWidth = 16,
    this.marginStartColor = const Color(0x7700BCD4),
    this.marginEndColor = const Color(0x3300BCD4),
  });
}
