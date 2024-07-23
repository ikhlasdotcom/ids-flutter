part of 'main.dart';

Story idsBadgeStory() {
  return Story(
    name: 'Widgets/IdsBadge',
    description: 'IDS Badge is a simple pills for a labelling widget.',
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text("IDS Badge Story"),
      ),
      body: Center(
        child: IdsBadge(
          label: context.knobs.text(label: 'Label', initial: 'IDS Badge'),
          maxLines: context.knobs.sliderInt(
            label: 'Max Lines',
            initial: 1,
            min: 1,
            max: 5,
          ),
          backgroundColor: context.knobs.options(
            label: 'Background Color',
            initial: Colors.grey,
            options: Helper().colorOption(),
          ),
          labelTextStyle: TextStyle(
            color: context.knobs.options(
              label: 'Text Color',
              initial: Colors.black,
              options: Helper().colorOption(),
            ),
            fontSize: context.knobs
                .sliderInt(
                  label: "Font Size",
                  initial: 12,
                  min: 8,
                  max: 48,
                )
                .toDouble(),
          ),
          radius: context.knobs
              .sliderInt(
                label: "Radius",
                initial: 10,
                min: 0,
                max: 100,
              )
              .toDouble(),
          padding: EdgeInsets.symmetric(
            horizontal: context.knobs
                .sliderInt(
                  label: "Padding Horizontal",
                  initial: 10,
                  min: 0,
                  max: 50,
                )
                .toDouble(),
            vertical: context.knobs
                .sliderInt(
                  label: "Padding Vertical",
                  initial: 2,
                  min: 0,
                  max: 50,
                )
                .toDouble(),
          ),
        ),
      ),
    ),
  );
}
