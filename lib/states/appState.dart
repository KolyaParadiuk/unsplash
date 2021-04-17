import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:provider/provider.dart';
import 'package:unsplash/states/api.dart';

class AppState extends HookWidget {
  final Widget child;

  AppState({required this.child});

  @override
  Widget build(BuildContext context) {
    var providers = [
      ChangeNotifierProvider<ApiState>(create: (_) => ApiState()),
    ];

    return MultiProvider(
      providers: providers,
      child: child,
    );
  }
}
