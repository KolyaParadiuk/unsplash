import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/hooks/useSize.dart';

class ServerError extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var theme = useTheme();
    var size = useSize();
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            color: theme.primaryColorLight,
            child: Center(child: Text("server error"))));
  }
}
