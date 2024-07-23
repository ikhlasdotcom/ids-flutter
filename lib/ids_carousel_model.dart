import 'package:flutter/material.dart';

class IdsCarouselModel {
  final String image;
  final String title;
  final String? description;
  final String? usp;
  final String? placeholderImage;
  final bool disable;
  final Widget? badgeWidget;
  final Widget? priceWidget;
  final Function(IdsCarouselModel) onTap;

  IdsCarouselModel({
    required this.image,
    required this.title,
    this.description,
    this.usp,
    this.placeholderImage,
    this.disable = false,
    this.badgeWidget,
    this.priceWidget,
    required this.onTap,
  });
}
