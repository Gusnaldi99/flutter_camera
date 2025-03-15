import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;
    if (count == 0) return;

    final size = context.size;
    final xCenter = size.width / 2;
    final yCenter = size.height / 2;
    final itemExtent = size.width / filtersPerScreen;
    final viewportExtent = count * itemExtent;
    final scrollOffset = viewportOffset.pixels;

    for (var i = 0; i < count; i++) {
      final childSize = context.getChildSize(i) ?? Size.zero;
      final dx = (i * itemExtent) - scrollOffset;
      final itemXCenter = dx + (childSize.width / 2);
      final normalizedDx = (xCenter - itemXCenter).abs() / xCenter;
      final scale = 1.0 - (normalizedDx * 0.2);

      final transform =
          Matrix4.identity()
            ..translate(dx, yCenter - childSize.height / 2)
            ..scale(scale);

      context.paintChild(i, transform: transform);
    }
  }

  @override
  bool shouldRepaint(CarouselFlowDelegate oldDelegate) =>
      oldDelegate.viewportOffset != viewportOffset;
}
