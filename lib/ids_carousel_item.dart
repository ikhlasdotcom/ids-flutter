import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'ids.dart';

class IdsCarouselItem extends StatefulWidget {
  const IdsCarouselItem({
    super.key,
    required this.title,
    required this.image,
    this.badgeWidget,
    this.usp,
    this.placeholderImage,
    this.description,
    this.priceWidget,
    this.disable = false,
  });

  final String title;
  final String image;
  final Widget? badgeWidget;
  final String? placeholderImage;
  final String? usp;
  final String? description;
  final Widget? priceWidget;
  final bool disable;

  @override
  State<IdsCarouselItem> createState() => _IdsCarouselItemState();
}

class _IdsCarouselItemState extends State<IdsCarouselItem> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return IdsCard(
      title: _getTitleWidget(),
      description: _getDescriptionWidget(),
      image: _getImageWidget(),
      label: widget.badgeWidget,
      footer: widget.priceWidget,
    );
  }

  Text _getTitleWidget() {
    return Text(
      widget.title,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget? _getDescriptionWidget() {
    if (widget.description == null) {
      return null;
    }
    return widget.description!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.description!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xff4C4C50)),
              ),
              if (widget.usp != null) ...[
                const SizedBox(height: 16),
                for (final itemHighlight in widget.usp!.split('\n'))
                  if (itemHighlight.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(
                        // left: Dimens.space16,
                        right: 16,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/ic_ticked.svg"),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              itemHighlight,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ],
          )
        : null;
  }

  Widget _getImageWidget() {
    return VisibilityDetector(
      key: Key('${widget.title}_${widget.image}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 0.9) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: isVisible
                ? widget.image
                : widget.placeholderImage ?? widget.image,
            fit: BoxFit.cover,
            // Background Color - Greyed out for Unavailable (Coming Soon) Packages

            color: widget.disable ? Colors.white : null,
            colorBlendMode: widget.disable ? BlendMode.color : null,
          ),
        ),
      ),
    );
  }
}
