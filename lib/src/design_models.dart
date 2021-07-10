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
  final LineDecorator intervalDecorator;
  final LineDecorator divisionDecorator;
  const GuideInterval(
    this.intervals, {
    this.divisions = 1,
    this.intervalDecorator =
        const LineDecorator(color: Color(0x7FC3E8F3), width: 0.5),
    this.divisionDecorator =
        const LineDecorator(color: Color(0x7FC3E8F3), width: 0.25),
  }) : assert(divisions > 0,
            'The "divisions" property must be greater than zero. If there were no divisions, the grid paper would not paint anything.');

  GuideInterval copyWith({
    int? intervals,
    int? divisions,
    LineDecorator? intervalDecorator,
    LineDecorator? divisionDecorator,
  }) {
    return GuideInterval(
      intervals ?? this.intervals,
      divisions: divisions ?? this.divisions,
      intervalDecorator: intervalDecorator ?? this.intervalDecorator,
      divisionDecorator: divisionDecorator ?? this.divisionDecorator,
    );
  }

  @override
  String toString() =>
      'GridInterval(intervals: $intervals, divisions: $divisions, intervalDecorator: $intervalDecorator, divisionDecorator: $divisionDecorator)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuideInterval &&
        other.intervals == intervals &&
        other.divisions == divisions &&
        other.intervalDecorator == intervalDecorator &&
        other.divisionDecorator == divisionDecorator;
  }

  @override
  int get hashCode =>
      intervals.hashCode ^
      divisions.hashCode ^
      intervalDecorator.hashCode ^
      divisionDecorator.hashCode;
}

class Keyline {
  final double xPos;
  final KeylineGravity gravity;
  final KeylineDecorator decorator;

  const Keyline(
    this.xPos, {
    this.gravity = KeylineGravity.start,
    this.decorator = const KeylineDecorator(

    ),
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

class KeylineDecorator {
  final LineDecorator? lineDecorator;
  final BlockLineDecorator? marginDecorator;
  const KeylineDecorator({
    this.lineDecorator =
        const LineDecorator(color: Color(0x77EC018C), width: 1),
    this.marginDecorator = const BlockLineDecorator(
        startColor: Color(0x5500BCD4),
        endColor: Color(0x1100BCD4),
        width: 16.0),
  });

  KeylineDecorator copyWith({
    LineDecorator? lineDecorator,
    BlockLineDecorator? marginDecorator,
  }) {
    return KeylineDecorator(
      lineDecorator: lineDecorator ?? this.lineDecorator,
      marginDecorator: marginDecorator ?? this.marginDecorator,
    );
  }

  @override
  String toString() =>
      'KeylineDecorator(lineDecorator: $lineDecorator, marginDecorator: $marginDecorator)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KeylineDecorator &&
        other.lineDecorator == lineDecorator &&
        other.marginDecorator == marginDecorator;
  }

  @override
  int get hashCode => lineDecorator.hashCode ^ marginDecorator.hashCode;
}

class LineDecorator {
  final Color color;
  final double width;
  const LineDecorator({
    required this.color,
    required this.width,
  });

  LineDecorator copyWith({
    Color? color,
    double? width,
  }) {
    return LineDecorator(
      color: color ?? this.color,
      width: width ?? this.width,
    );
  }

  @override
  String toString() => 'LineDecorator(color: $color, width: $width)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LineDecorator &&
        other.color == color &&
        other.width == width;
  }

  @override
  int get hashCode => color.hashCode ^ width.hashCode;
}

class BlockLineDecorator {
  final Color startColor;
  final Color endColor;
  final double width;
  const BlockLineDecorator({
    required this.startColor,
    required this.endColor,
    required this.width,
  });

  BlockLineDecorator copyWith({
    Color? startColor,
    Color? endColor,
    double? width,
  }) {
    return BlockLineDecorator(
      startColor: startColor ?? this.startColor,
      endColor: endColor ?? this.endColor,
      width: width ?? this.width,
    );
  }

  @override
  String toString() =>
      'RectDecorator(startColor: $startColor, endColor: $endColor, width: $width)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlockLineDecorator &&
        other.startColor == startColor &&
        other.endColor == endColor &&
        other.width == width;
  }

  @override
  int get hashCode => startColor.hashCode ^ endColor.hashCode ^ width.hashCode;
}
