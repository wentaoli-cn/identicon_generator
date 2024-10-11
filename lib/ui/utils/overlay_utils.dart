import 'package:flutter/material.dart';

class OverlayUtils {
  static final List<OverlayEntry> _entries = [];

  static bool get isEmpty => _entries.isEmpty;

  static void showOverlay(BuildContext context, OverlayEntry entry) {
    final overlay = Overlay.of(context);

    overlay.insert(entry);
    _entries.add(entry);
  }

  static void tryToShowOverlay(BuildContext context, OverlayEntry entry) {
    if (isEmpty) {
      showOverlay(context, entry);
    }
  }

  static void rebuildOverlay(OverlayEntry entry) {
    entry.markNeedsBuild();
  }

  static void rebuildAll() {
    for (final entry in _entries) {
      rebuildOverlay(entry);
    }
  }

  static void removeOverlay(OverlayEntry entry) {
    entry.remove();
    entry.dispose();
    _entries.remove(entry);
  }

  static void removeAll() {
    for (final entry in _entries) {
      entry.remove();
      entry.dispose();
    }
    _entries.clear();
  }
}
