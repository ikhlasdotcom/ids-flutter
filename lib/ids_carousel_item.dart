import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'ids_shimmer.dart';

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
    this.isLoading = false,
    this.imageBoxFit,
  });

  final Widget titleWidget;
  final String image;
  final Widget? badgeWidget;
  final String? placeholderImage;
  final Widget? descriptionWidget;
  final Widget? footerWidget;
  final bool disable;
  final bool isLoading;
  final BoxFit? imageBoxFit;

  // Factory constructor to create a loading state
  factory IdsCarouselItem.loading({
    int itemCount = 4,
    EdgeInsets? titlePadding,
  }) {
    return const IdsCarouselItem(
      titleWidget: SizedBox.shrink(),
      image: "",
      isLoading: true,
    );
  }

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
              widget.isLoading
                  ? IdsShimmer.rectangular(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 4,
                    )
                  : widget.titleWidget,
              if (widget.descriptionWidget != null) ...[
                const SizedBox(height: 4),
                widget.descriptionWidget!,
              ],
            ],
          ),
          const SizedBox(height: 4),
          widget.isLoading
              ? IdsShimmer.rectangular(
                  height: 15,
                  width: MediaQuery.of(context).size.width / 6,
                )
              : widget.footerWidget ?? const SizedBox.shrink(),
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
        child: Container(
          color: Color(0xffF8F8F8),
          padding:
              widget.imageBoxFit != BoxFit.cover && widget.imageBoxFit != null
                  ? const EdgeInsets.all(16)
                  : EdgeInsets.zero,
          child: AspectRatio(
            aspectRatio: 1,
            child: widget.isLoading
                ? IdsShimmer.rectangular(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 4,
                  )
                : CachedNetworkImage(
                    imageUrl: isVisible
                        ? widget.image
                        : widget.placeholderImage ?? widget.image,
                    fit: widget.imageBoxFit ?? BoxFit.cover,
                    color: widget.disable ? Colors.white : null,
                    colorBlendMode: widget.disable ? BlendMode.color : null,
                  ),
          ),
        ),
      ),
    );
  }
}
