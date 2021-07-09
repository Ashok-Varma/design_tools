import 'dart:ui' as ui;

import 'package:design_tools/design_tools.dart';
import 'package:design_tools/src/design_grid.dart';
import 'package:design_tools/src/design_keylines.dart';
import 'package:flutter/material.dart';

class DesignTools extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final GuideInterval? verticalInterval;
  final GuideInterval? horizontalInterval;
  final List<Keyline> keylines;

  const DesignTools({
    required this.child,
    this.enabled = true,
    this.verticalInterval = const GuideInterval(16, divisions: 2),
    this.horizontalInterval = const GuideInterval(16, divisions: 2),
    this.keylines = const [
      Keyline(16),
      Keyline(72),
      Keyline(16, gravity: KeylineGravity.end)
    ],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }
    return CustomPaint(
      foregroundPainter: DesignPainter(
        designGridPainter: DesignGridPainter(
          verticalInterval: verticalInterval,
          horizontalInterval: horizontalInterval,
        ),
        designKeylinePainter: DesignKeylinePainter(
          keylines: keylines,
        ),
      ),
      child: child,
      // child: Expanded(),
    );

    // MediaQuery(
    //   data: MediaQueryData.fromWindow(ui.window),
    //   child: Directionality(
    //     textDirection: TextDirection.rtl,
    //     child: Stack(
    //       children: [
    //         CustomPaint(
    //           foregroundPainter: DesignPainter(
    //             designGridPainter: DesignGridPainter(
    //               verticalInterval: verticalInterval,
    //               horizontalInterval: horizontalInterval,
    //             ),
    //             designKeylinePainter: DesignKeylinePainter(
    //               keylines: keylines,
    //             ),
    //           ),
    //           child: child,
    //           // child: Expanded(),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class DesignPainter extends CustomPainter {
  List<CustomPainter> painters;
  DesignGridPainter designGridPainter;
  DesignKeylinePainter designKeylinePainter;

  DesignPainter({
    required this.designGridPainter,
    required this.designKeylinePainter,
  }) : painters = [designGridPainter, designKeylinePainter];

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    for (final CustomPainter painter in painters) {
      painter.paint(canvas, size);
    }
  }

  @override
  bool shouldRepaint(DesignPainter oldDelegate) =>
      oldDelegate.designGridPainter.shouldRepaint(designGridPainter) ||
      oldDelegate.designKeylinePainter.shouldRepaint(designKeylinePainter);
}
