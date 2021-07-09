import 'package:flutter/material.dart';

class GuideInterval {
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

  const GuideInterval(
    this.intervals, {
    this.divisions = 1,
    this.decoration = const GridIntervalDecoration(),
  }) : assert(divisions > 0,
            'The "divisions" property must be greater than zero. If there were no divisions, the grid paper would not paint anything.');

  GuideInterval copyWith({
    int? intervals,
    int? divisions,
    GridIntervalDecoration? decoration,
  }) {
    return GuideInterval(
      intervals ?? this.intervals,
      divisions: divisions ?? this.divisions,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  String toString() =>
      'GridInterval(intervals: $intervals, divisions: $divisions, decoration: $decoration)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuideInterval &&
        other.intervals == intervals &&
        other.divisions == divisions &&
        other.decoration == decoration;
  }

  @override
  int get hashCode =>
      intervals.hashCode ^ divisions.hashCode ^ decoration.hashCode;
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

  GridIntervalDecoration copyWith({
    Color? intervalColor,
    Color? divisionSeperatorColor,
    double? intervalWidth,
    double? divisionSeperatorWidth,
  }) {
    return GridIntervalDecoration(
      intervalColor: intervalColor ?? this.intervalColor,
      divisionSeperatorColor:
          divisionSeperatorColor ?? this.divisionSeperatorColor,
      intervalWidth: intervalWidth ?? this.intervalWidth,
      divisionSeperatorWidth:
          divisionSeperatorWidth ?? this.divisionSeperatorWidth,
    );
  }

  @override
  String toString() {
    return 'GridIntervalDecoration(intervalColor: $intervalColor, divisionSeperatorColor: $divisionSeperatorColor, intervalWidth: $intervalWidth, divisionSeperatorWidth: $divisionSeperatorWidth)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GridIntervalDecoration &&
        other.intervalColor == intervalColor &&
        other.divisionSeperatorColor == divisionSeperatorColor &&
        other.intervalWidth == intervalWidth &&
        other.divisionSeperatorWidth == divisionSeperatorWidth;
  }

  @override
  int get hashCode {
    return intervalColor.hashCode ^
        divisionSeperatorColor.hashCode ^
        intervalWidth.hashCode ^
        divisionSeperatorWidth.hashCode;
  }
}

class Keyline {
  final double xPos;
  final KeylineGravity gravity;
  final KeylineDecorator decorator;
  const Keyline(
    this.xPos, {
    this.gravity = KeylineGravity.start,
    this.decorator = _materialSpec,
  });

  Keyline copyWith({
    double? xPos,
    KeylineGravity? gravity,
    KeylineDecorator? decorator,
  }) {
    return Keyline(
      xPos ?? this.xPos,
      gravity: gravity ?? this.gravity,
      decorator: decorator ?? this.decorator,
    );
  }

  @override
  String toString() =>
      'Keyline(xPos: $xPos, gravity: $gravity, decorator: $decorator)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Keyline &&
        other.xPos == xPos &&
        other.gravity == gravity &&
        other.decorator == decorator;
  }

  @override
  int get hashCode => xPos.hashCode ^ gravity.hashCode ^ decorator.hashCode;
}

enum KeylineGravity { start, end }

const _materialSpec = KeylineDecorator._(
    lineWidth: _lineWidth,
    lineColor: _lineColor,
    marginWidth: _marginWidth,
    marginStartColor: _marginStartColor,
    marginEndColor: _marginEndColor);

const _lineWidth = 1.0;
const _lineColor = Color(0x77EC018C);
const _marginWidth = 16.0;
const _marginStartColor = Color(0x5500BCD4);
const _marginEndColor = Color(0x1100BCD4);

class KeylineDecorator {
  final double? lineWidth;
  final Color? lineColor;
  final double? marginWidth;
  final Color? marginStartColor;
  final Color? marginEndColor;
  const KeylineDecorator._({
    this.lineWidth,
    this.lineColor,
    this.marginWidth,
    this.marginStartColor,
    this.marginEndColor,
  });

  factory KeylineDecorator.materialSpec() => _materialSpec;

  factory KeylineDecorator.onlyLine(
          {double lineWidth = _lineWidth, Color lineColor = _lineColor}) =>
      KeylineDecorator._(lineWidth: lineWidth, lineColor: lineColor);

  factory KeylineDecorator.onlyMargin(
          {double marginWidth = _marginWidth,
          Color marginStartColor = _marginStartColor,
          Color marginEndColor = _marginEndColor}) =>
      KeylineDecorator._(
          marginWidth: marginWidth,
          marginStartColor: marginStartColor,
          marginEndColor: marginEndColor);

  factory KeylineDecorator.defaultWith({
    double lineWidth = _lineWidth,
    Color lineColor = _lineColor,
    double marginWidth = _marginWidth,
    Color marginStartColor = _marginStartColor,
    Color marginEndColor = _marginEndColor,
  }) =>
      KeylineDecorator._(
          lineWidth: lineWidth,
          lineColor: lineColor,
          marginWidth: marginWidth,
          marginStartColor: marginStartColor,
          marginEndColor: marginEndColor);

  @override
  String toString() {
    return 'KeylineDecorator(lineWidth: $lineWidth, lineColor: $lineColor, marginWidth: $marginWidth, marginStartColor: $marginStartColor, marginEndColor: $marginEndColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KeylineDecorator &&
        other.lineWidth == lineWidth &&
        other.lineColor == lineColor &&
        other.marginWidth == marginWidth &&
        other.marginStartColor == marginStartColor &&
        other.marginEndColor == marginEndColor;
  }

  @override
  int get hashCode {
    return lineWidth.hashCode ^
        lineColor.hashCode ^
        marginWidth.hashCode ^
        marginStartColor.hashCode ^
        marginEndColor.hashCode;
  }
}
