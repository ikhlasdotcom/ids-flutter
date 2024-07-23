import 'package:flutter/material.dart';

class IdsCard extends StatelessWidget {
  const IdsCard({
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.image,
    required this.title,
    required this.description,
    this.footer,
    this.label,
    this.imageRadius = 20,
  });

  /// Decoration parameter
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double imageRadius;

  /// Widget inside card
  final Widget? image;
  final Widget title;
  final Widget? description;
  final Widget? footer;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(imageRadius),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Only visible if Image Available
          if (image != null)
            Stack(
              children: [
                image!,
                if (label != null) label!,
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              title,
              if (description != null) ...[
                const SizedBox(height: 4),
                description!,
              ],
            ],
          ),
          const SizedBox(height: 4),
          footer ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
