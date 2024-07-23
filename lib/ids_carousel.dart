import 'package:flutter/material.dart';
import 'package:ids_flutter/expendable_page_view.dart';

import 'ids.dart';

class IdsCarousel extends StatelessWidget {
  const IdsCarousel({
    super.key,
    required this.title,
    required this.description,
    required this.items,
    this.onTitleTap,
    this.margin,
    this.itemsPerPage = 2,
  });

  final String title;
  final String description;
  final List<IdsCarouselModel> items;
  final EdgeInsets? margin;
  final VoidCallback? onTitleTap;
  final int itemsPerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(itemsPerPage), // Use a unique key based on itemsPerPage
      margin: margin ?? EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTitleTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
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
                                    const WidgetSpan(child: SizedBox(width: 6)),
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
                    ),
                    if (description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ExpandablePageView(
            controller: PageController(
              viewportFraction: (1 / itemsPerPage) - 0.05,
            ),
            onPageChanged: (int index) {},
            padEnds: false,
            children: [
              ...items.asMap().map((index, item) {
                return MapEntry(
                  index,
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => item.onTap(item),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: IdsCarouselItem(
                          image: item.image,
                          placeholderImage: item.placeholderImage,
                          disable: item.disable,
                          badgeWidget: item.badgeWidget,
                          title: item.title,
                          description: item.description,
                          priceWidget: item.priceWidget,
                          usp: item.usp,
                        ),
                      ),
                    ),
                  ),
                );
              }).values,

              /// Add empty container to make sure the last item padding is
              /// shown because of we are using viewportFraction and we cannot
              /// adjust padding normally without compromise the item size
              ///
              if (itemsPerPage > 1) ...[
                const SizedBox.shrink(),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
