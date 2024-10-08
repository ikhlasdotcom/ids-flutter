import 'package:flutter/material.dart';

import 'ids.dart';
import 'ids_carousel_item.dart';
import 'ids_shimmer.dart';
import 'widget/expendable_page_view.dart';

class IdsCarousel extends StatelessWidget {
  const IdsCarousel({
    super.key,
    required this.title,
    required this.description,
    required this.items,
    this.onTitleTap,
    this.margin,
    this.titlePadding,
    this.carouselSpace,
    this.itemsPerPage = 2,
    this.isLoading = false,
  });

  final String title;
  final String description;
  final List<IdsCarouselModel> items;
  final EdgeInsets? margin;
  final EdgeInsets? titlePadding;
  final double? carouselSpace;
  final VoidCallback? onTitleTap;
  final int itemsPerPage;
  final bool isLoading;

  // Factory constructor to create a loading state
  factory IdsCarousel.loading({
    int itemCount = 4,
    EdgeInsets? titlePadding,
  }) {
    return IdsCarousel(
      title: "",
      description: "",
      titlePadding: titlePadding,
      items: List.generate(
        itemCount,
        (_) => IdsCarouselModel(
          imageUrl: "",
          titleWidget: const SizedBox.shrink(),
          onTap: (item) {},
        ),
      ),
      isLoading: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(itemsPerPage),
      margin: margin ?? EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: titlePadding ?? const EdgeInsets.all(0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: onTitleTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading
                        ? IdsShimmer.rectangular(
                            height: 30,
                            width: MediaQuery.of(context).size.width / 2,
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      if (onTitleTap != null) ...[
                                        const WidgetSpan(
                                            child: SizedBox(width: 6)),
                                        WidgetSpan(
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.grey[200],
                                            child: const Icon(
                                              Icons.chevron_right,
                                              size: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                    isLoading
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                              bottom: 4.0,
                            ),
                            child: IdsShimmer.rectangular(
                              height: 15,
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          )
                        : description.isNotEmpty
                            ? Text(
                                description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.grey[600]),
                              )
                            : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
          ExpandablePageView(
            controller: PageController(
              viewportFraction: (1 / itemsPerPage) - 0.05,
            ),
            onPageChanged: (int index) {},
            padEnds: false,
            children: isLoading
                ? List.generate(
                    items.length,
                    (_) => Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: IdsCarouselItem.loading(),
                    ),
                  )
                : [
                    ...items.asMap().map((index, item) {
                      return MapEntry(
                        index,
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () => item.onTap(item),
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: carouselSpace ?? 0),
                              child: IdsCarouselItem(
                                image: item.imageUrl,
                                placeholderImage: item.placeholderImageUrl,
                                disable: item.disable,
                                badgeWidget: item.badgeWidget,
                                titleWidget: item.titleWidget,
                                descriptionWidget: item.descriptionWidget,
                                footerWidget: item.footerWidget,
                                imageBoxFit: item.imageBoxFit,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).values,
                    if (items.length > 1) ...[
                      const SizedBox.shrink(),
                    ]
                  ],
          ),
        ],
      ),
    );
  }
}
