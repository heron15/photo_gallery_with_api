import 'package:flutter/material.dart';
import 'package:photo_gallery_with_api/themes/app_bar_theme.dart';
import 'package:photo_gallery_with_api/utils/app_route.dart';
import 'package:photo_gallery_with_api/view/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: getAppBarTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.home,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
