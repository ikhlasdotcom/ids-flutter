import 'package:flutter/material.dart';
import 'package:ids_flutter/widget/size_reporting_widet.dart';

class ExpandablePageView extends StatefulWidget {
  final List<Widget> children;
  final void Function(int index) onPageChanged;
  final PageController? controller;
  final bool padEnds;

  const ExpandablePageView({
    super.key,
    required this.children,
    required this.onPageChanged,
    this.controller,
    this.padEnds = true,
  });

  @override
  State<ExpandablePageView> createState() => _ExpandablePageViewState();
}

class _ExpandablePageViewState extends State<ExpandablePageView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late List<double> _heights;
  double _maxHeight = 0;
  int _currentPage = 0;

  double get _currentHeight => _maxHeight;

  @override
  void initState() {
    _heights = widget.children.map((e) => 0.0).toList();
    super.initState();
    _pageController = widget.controller ?? PageController()
      ..addListener(() {
        final newPage = _pageController.page?.round() ?? 0;
        if (_currentPage != newPage) {
          setState(() => _currentPage = newPage);
        }
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        padEnds: widget.padEnds,
        controller: _pageController,
        onPageChanged: widget.onPageChanged,
        children: _sizeReportingChildren
            .asMap() //
            .map((index, child) => MapEntry(index, child))
            .values
            .toList(),
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap() //
      .map(
        (index, child) => MapEntry(
          index,
          OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: SizeReportingWidget(
              onSizeChange: (size) {
                setState(() {
                  _heights[index] = size.height;
                  _maxHeight = _heights.reduce((a, b) => a > b ? a : b);
                });
              },
              child: Align(child: child),
            ),
          ),
        ),
      )
      .values
      .toList();
}
