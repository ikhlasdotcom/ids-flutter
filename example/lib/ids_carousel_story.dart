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
            title: "Title Item ${index + 1}",
            description: "Description Item ${index + 1}",
            image: "https://picsum.photos/200/200",
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
            priceWidget: Text("Footer Item ${index + 1}"),
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
