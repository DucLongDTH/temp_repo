import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';

class MyTransitions extends CustomTransition {
  Offset offset;

  MyTransitions({required this.offset});

  @override
  Widget buildTransition(BuildContext context, Curve? curve, Alignment? alignment, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ClipPath(
      clipper: CircularRevealClipper(
        fraction: animation.value,
        offset: offset,
        minRadius: 0,
        maxRadius: 1000,
      ),
      child: child,
    );
  }
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset offset;
  final double? minRadius;
  final double? maxRadius;

  CircularRevealClipper({
    required this.fraction,
    required this.offset,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final minRadius = this.minRadius ?? 0;
    final maxRadius = this.maxRadius ?? calcMaxRadius(size, offset);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: offset,
          radius: lerpDouble(minRadius, maxRadius, fraction)!,
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}