import 'package:flutter/material.dart';
import 'package:ids_flutter/ids.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'helper.dart';

part 'ids_badge_story.dart';
part 'ids_carousel_loading_story.dart';
part 'ids_carousel_story.dart';
part 'ids_price_story.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Storybook(
        plugins: [
          ThemeModePlugin(initialTheme: ThemeMode.light),
          DeviceFramePlugin(
            initialData: (
              isFrameVisible: true,
              device: Devices.ios.iPhone13ProMax,
              orientation: Orientation.portrait,
            ),
          ),
        ],
        initialStory: 'Widgets/IdsPrice',
        stories: [
          idsBadgeStory(),
          idsPriceStory(),
          idsCarouselStory(),
          idsCarouselLoadingStory(),
        ],
      );
}
