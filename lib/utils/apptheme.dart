import 'package:books/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    cardTheme: CardTheme(
      elevation: kElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
    ),
  );
}
