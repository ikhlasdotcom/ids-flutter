import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IdsShimmer extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color baseColor;
  final Color? highlightColor;

  IdsShimmer.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.baseColor = const Color(0xFFE0E0E0),
    double borderRadius = 5,
    this.highlightColor,
  }) : shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );

  const IdsShimmer.circular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.baseColor = const Color(0xFFE0E0E0),
    this.shapeBorder = const CircleBorder(),
    this.highlightColor,
  });

  const IdsShimmer.custom({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.baseColor = const Color(0xFFE0E0E0),
    required this.shapeBorder,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor ?? const Color(0xffF8F8F8),
        period: const Duration(seconds: 1),
        child: Container(
          clipBehavior: Clip.none,
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}
