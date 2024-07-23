part of 'main.dart';

Story idsPriceStory() {
  return Story(
    name: 'Widgets/IdsPrice',
    description:
        'IDs Price is a widget to show a price with currency and label',
    builder: (context) => IdsPrice(
      priceLabel: context.knobs.text(label: 'Price Label', initial: 'From'),
      labelTextStyle: TextStyle(
        color: context.knobs.options(
          label: 'Label Font Color',
          initial: Colors.grey,
          options: Helper().colorOption(),
        ),
        fontSize: context.knobs
            .sliderInt(
              label: "Label Font Size",
              initial: 12,
              min: 8,
              max: 96,
            )
            .toDouble(),
      ),
      priceCurrency:
          context.knobs.text(label: 'Price Currency', initial: 'MYR'),
      priceAmount:
          context.knobs.text(label: 'Price Amount', initial: '5999.00'),
      priceTextStyle: TextStyle(
        color: context.knobs.options(
          label: 'Price Font Color',
          initial: Colors.grey,
          options: Helper().colorOption(),
        ),
        fontSize: context.knobs
            .sliderInt(
              label: "Price Font Size",
              initial: 48,
              min: 8,
              max: 96,
            )
            .toDouble(),
      ),
    ),
  );
}
