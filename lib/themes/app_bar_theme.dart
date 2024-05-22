import 'package:flutter/material.dart';
import 'package:photo_gallery_with_api/utils/custom_color.dart';

AppBarTheme getAppBarTheme()=>const AppBarTheme(
  backgroundColor: CustomColor.appBarColor,
  foregroundColor: CustomColor.white,
  iconTheme: IconThemeData(
    size: 28,
    color: CustomColor.white
  ),
  titleTextStyle: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
  ),
);