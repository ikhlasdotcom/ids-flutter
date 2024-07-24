import 'package:flutter/material.dart';

class IdsPrice extends StatelessWidget {
  const IdsPrice({
    super.key,
    required this.priceLabel,
    this.labelTextStyle,
    required this.priceCurrency,
    required this.priceAmount,
    this.priceTextStyle,
  });

  final String priceLabel;
  final TextStyle? labelTextStyle;
  final String priceCurrency;
  final String priceAmount;
  final TextStyle? priceTextStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '$priceLabel\n',
            style: labelTextStyle ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              '$priceCurrency $priceAmount',
              style: priceTextStyle ?? Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
