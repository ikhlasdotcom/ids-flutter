part of 'main.dart';

Story idsCarouselStory() {
  return Story(
    name: 'Widgets/IdsCarousel',
    description:
        'IDs Price is a widget to show a price with currency and label',
    builder: (context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("IDS Carousel Story"),
      ),
      body: IdsCarousel(
        itemsPerPage: context.knobs.sliderInt(
          label: "Items Per Page",
          initial: 2,
          min: 1,
          max: 5,
        ),
        onTitleTap:
            context.knobs.boolean(label: 'Enable Title Click', initial: true)
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Title Clicked"),
                      ),
                    );
                  }
                : null,
        title: context.knobs.text(label: 'Title', initial: "Carousel Title"),
        description: context.knobs.text(
            label: 'Description', initial: "This is Carousel Description"),
        margin: EdgeInsets.symmetric(
          horizontal: context.knobs
              .sliderInt(
                label: "Margin Horizontal",
                initial: 0,
                min: 0,
                max: 50,
              )
              .toDouble(),
          vertical: context.knobs
              .sliderInt(
                label: "Margin Vertical",
                initial: 0,
                min: 0,
                max: 50,
              )
              .toDouble(),
        ),
        items: List.generate(10, (index) {
          return IdsCarouselModel(
            titleWidget: Text(
              "Title Item ${index + 1}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            descriptionWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Description Item ${index + 1}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: const Color(0xff4C4C50)),
                ),
                const SizedBox(height: 16),
                for (final itemHighlight
                    in "USP Item ${index + 1}.1\nUSP Item ${index + 1}.2"
                        .split('\n'))
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
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xff4C4C50),
                            size: 16,
                          ),
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
            ),
            imageUrl: "https://picsum.photos/200/200",
            badgeWidget: IdsBadge(
              label: "Badge ${index + 1}",
              backgroundColor: context.knobs.options(
                label: 'Badge Background Color',
                initial: Colors.black,
                options: Helper().colorOption(),
              ),
              labelTextStyle: TextStyle(
                  color: context.knobs.options(
                label: 'Badge Text Color',
                initial: Colors.white,
                options: Helper().colorOption(),
              )),
            ),
            footerWidget: Text("Footer Item ${index + 1}"),
            onTap: (a) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Item ${index + 1} Clicked"),
                ),
              );
            },
          );
        }),
      ),
    ),
  );
}
