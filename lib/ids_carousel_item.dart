import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IdsCarouselItem extends StatefulWidget {
  const IdsCarouselItem({
    super.key,
    required this.titleWidget,
    required this.image,
    this.badgeWidget,
    this.placeholderImage,
    this.descriptionWidget,
    this.footerWidget,
    this.disable = false,
  });

  final Widget titleWidget;
  final String image;
  final Widget? badgeWidget;
  final String? placeholderImage;
  final Widget? descriptionWidget;
  final Widget? footerWidget;
  final bool disable;

  @override
  State<IdsCarouselItem> createState() => _IdsCarouselItemState();
}

class _IdsCarouselItemState extends State<IdsCarouselItem> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Only visible if Image Available
          Stack(
            children: [
              _getImageWidget(),
              if (widget.badgeWidget != null) widget.badgeWidget!,
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              widget.titleWidget,
              if (widget.descriptionWidget != null) ...[
                const SizedBox(height: 4),
                widget.descriptionWidget!,
              ],
            ],
          ),
          const SizedBox(height: 4),
          widget.footerWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _getImageWidget() {
    return VisibilityDetector(
      key: Key(widget.image),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 0.9) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: isVisible
                ? widget.image
                : widget.placeholderImage ?? widget.image,
            fit: BoxFit.cover,
            color: widget.disable ? Colors.white : null,
            colorBlendMode: widget.disable ? BlendMode.color : null,
          ),
        ),
      ),
    );
  }
}
