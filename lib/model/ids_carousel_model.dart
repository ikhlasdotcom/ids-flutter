import 'package:flutter/material.dart';

class IdsCarouselModel {
  final String imageUrl;
  final String? placeholderImageUrl;
  final Widget titleWidget;
  final Widget? descriptionWidget;
  final bool disable;
  final Widget? badgeWidget;
  final Widget? footerWidget;
  final Function(IdsCarouselModel) onTap;
  final BoxFit? imageBoxFit;

  IdsCarouselModel({
    required this.imageUrl,
    required this.titleWidget,
    this.descriptionWidget,
    this.placeholderImageUrl,
    this.disable = false,
    this.badgeWidget,
    this.footerWidget,
    this.imageBoxFit,
    required this.onTap,
  });
}
