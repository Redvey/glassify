import 'dart:ui';
import 'package:flutter/material.dart';
import 'glass_border.dart';

/// A flexible, glassmorphic container that expands within a Flex widget (e.g. Row, Column).
/// Provides a blur effect, gradient background, and optional border.
class GlassFlexContainer extends StatelessWidget {
  final int flex;
  final double borderRadius;
  final double blur;
  final double border;
  final LinearGradient backgroundGradient;
  final LinearGradient borderGradient;

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Matrix4? transform;
  final Widget? child;

   GlassFlexContainer({
    super.key,
    this.flex = 1,
    required this.borderRadius,
    required this.blur,
    required this.border,
    required this.backgroundGradient,
    required this.borderGradient,
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.transform,
    this.child,
  })  : assert(flex >= 1, 'Flex must be >= 1'),
        assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        transform: transform,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
                child: Container(
                  alignment: alignment,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: backgroundGradient,
                  ),
                ),
              ),
            ),
            GlassBorder(
              strokeWidth: border,
              radius: borderRadius,
              gradient: borderGradient,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: child ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
