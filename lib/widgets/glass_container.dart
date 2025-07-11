import 'dart:ui';
import 'package:flutter/material.dart';
import 'glass_border.dart';

/// A glassmorphic container with fixed width and height.
/// Provides a frosted glass blur effect, gradient background, and optional border.
class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final double border;
  final LinearGradient backgroundGradient;
  final LinearGradient borderGradient;

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final Widget? child;

   GlassContainer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.blur,
    required this.border,
    required this.backgroundGradient,
    required this.borderGradient,
    this.alignment,
    this.padding,
    this.margin,
    this.transform,
    this.child,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      transform: transform,
      child: Stack(
        alignment: alignment ?? Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
              child: Container(
                padding: padding,
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
            width: width,
            height: height,
            gradient: borderGradient,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: child ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
