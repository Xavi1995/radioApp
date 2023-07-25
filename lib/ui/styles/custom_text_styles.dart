import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomStyles {
  static TextStyle landingHeader = const TextStyle(
      fontSize: 20,
      color: CustomColors.primaryColor,
      fontWeight: FontWeight.bold);
  static TextStyle header = const TextStyle(
    fontSize: 24.0,
  );
  static TextStyle smallHeader = const TextStyle(fontSize: 18);
  static TextStyle appBarTitle = const TextStyle(
      fontSize: 18,
      color: CustomColors.primaryColor,
      fontWeight: FontWeight.bold);
  static TextStyle smallBody = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryColor);
  static TextStyle extraSmallBody = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: CustomColors.grey);
}
