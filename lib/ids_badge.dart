import 'package:flutter/material.dart';

class IdsBadge extends StatelessWidget {
  const IdsBadge({
    super.key,
    required this.label,
    this.labelTextStyle,
    required this.backgroundColor,
    this.radius = 10,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 2,
    ),
  });

  final String label;
  final TextStyle? labelTextStyle;
  final Color backgroundColor;
  final double radius;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Text(
        label,
        style: labelTextStyle,
      ),
    );
  }
}
