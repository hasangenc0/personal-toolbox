import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

Color getToolboxColor(BuildContext context) {
  bool isDark = AdaptiveTheme.of(context).mode.isDark;

  if (isDark) {
    return Colors.greenAccent;
  }

  return Colors.redAccent;
}

Color getToolboxTitleColor(BuildContext context) {
  bool isDark = AdaptiveTheme.of(context).mode.isDark;

  if (isDark) {
    return Colors.white;
  }

  return Colors.black;
}
