import 'package:flutter/material.dart';
import 'package:unsplash/screens/ImageaFeedScreen.dart';
import 'package:unsplash/screens/imageDetailScreen.dart';
import 'package:unsplash/screens/init.dart';

class AppRouter{
    static Map<String, WidgetBuilder> routes = {
    ImageFeedScreen.navigationKey: (_) => ImageFeedScreen(),
    ImageDetailScreen.navigationKey:(_) => ImageDetailScreen(),
    InitScreen.navigationKey:(_) => InitScreen()
  };
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder:
            routes[settings.name] ?? (BuildContext context) => Container(),
        settings: settings);
  }
}