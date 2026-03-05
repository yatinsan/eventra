import 'package:flutter/material.dart';

final circleOverlay = OverlayEntry(
  builder: (context) => Container(
    decoration: BoxDecoration(color: Colors.black26),
    child: Center(child: CircularProgressIndicator()),
  ),
);

void showCircle(BuildContext context) {
  if (context.mounted) {
    Overlay.of(context).insert(circleOverlay);
  }
}

void removeCircle() {
  if (circleOverlay.mounted) {
    try {
      circleOverlay.remove();
    } catch (e) {
      return;
    }
  }
}
