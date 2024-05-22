import 'package:flutter/material.dart';
import 'package:photo_gallery_with_api/model/photo_model.dart';
import 'package:photo_gallery_with_api/view/screens/details_view_screen.dart';

import '../view/screens/home_screen.dart';

class AppRoute {
  static const String home = "/home";
  static const String detailsView = "/details_view";

  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    Widget? widget;
    switch (settings.name) {
      case home:
        widget = const HomeScreen();
        break;

      case detailsView:
        PhotoModel photoModel = settings.arguments as PhotoModel;
        widget = DetailsViewScreen(photoModel:photoModel);
        break;
    }

    if (widget != null) {
      return MaterialPageRoute(builder: (context) => widget!);
    }

    return null;
  }
}