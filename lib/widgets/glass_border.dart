import 'package:flutter/material.dart';

/// A gradient border around a glassmorphic container.
class GlassBorder extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final double? width;
  final double? height;

  const GlassBorder({
    super.key,
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientPainter(
        strokeWidth: strokeWidth,
        radius: radius,
        gradient: gradient,
      ),
      size: Size(width ?? 0, height ?? 0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final innerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        strokeWidth,
        strokeWidth,
        size.width - strokeWidth * 2,
        size.height - strokeWidth * 2,
      ),
      Radius.circular(radius - strokeWidth),
    );

    final path = Path()
      ..addRRect(outerRRect)
      ..addRRect(innerRRect)
      ..fillType = PathFillType.evenOdd;

    final paint = Paint()
      ..shader = gradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
