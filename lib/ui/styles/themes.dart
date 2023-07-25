import 'package:flutter/material.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';

enum AppTheme { light }

final Map<AppTheme, ThemeData> appThemesData = {
  AppTheme.light: ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Roboto',
      primaryColor: CustomColors.primaryColor,
      scaffoldBackgroundColor: CustomColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        color: CustomColors.backgroundColor,
        elevation: 1,
        shadowColor: Colors.transparent,
      ),
      colorScheme: ColorScheme.fromSwatch(errorColor: CustomColors.error))
};
