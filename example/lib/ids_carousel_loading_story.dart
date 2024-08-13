part of 'main.dart';

Story idsCarouselLoadingStory() {
  return Story(
    name: 'Widgets/IdsCarouselLoading',
    description: 'IDs Price is a widget to show a'
        ' price with currency and label',
    builder: (context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("IDS Carousel Story"),
      ),
      body: IdsCarousel.loading(
        titlePadding: const EdgeInsets.only(
          left: 16,
          bottom: 16,
          right: 16,
        ),
      ),
    ),
  );
}
