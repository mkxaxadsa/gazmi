import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.sfR,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.white50,
    selectionColor: AppColors.white50,
    selectionHandleColor: AppColors.white50,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.main, // overscroll indicator color
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(0.75),
  ),
);
