import 'package:flutter/material.dart';
import 'package:unsplash/router.dart';
import 'package:unsplash/screens/ImageaFeedScreen.dart';
import 'package:unsplash/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UnspashTheme.theme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: ImageFeedScreen.navigationKey
    );
  }
}
