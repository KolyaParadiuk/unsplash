import 'package:flutter/material.dart';
import 'package:unsplash/router.dart';
import 'package:unsplash/screens/init.dart';
import 'package:unsplash/states/appState.dart';
import 'package:unsplash/theme.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return AppState(
          child: MaterialApp(
        theme: UnspashTheme.theme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: InitScreen.navigationKey
      ),
    );
  }
}
