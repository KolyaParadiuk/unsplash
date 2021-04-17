import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/hooks/useSize.dart';
import 'package:unsplash/models/photo.dart';

class FeedImage extends HookWidget {
  final Photo image;
  FeedImage({required this.image});
  @override
  Widget build(BuildContext context) {
    var width = useSize().width / 2 - 5;
    var theme = useTheme();
    return GestureDetector(
            child: Container(
            color: theme.primaryColorLight,
            padding: EdgeInsets.all(5),
            width: width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(image.urls.small))),
    );
  }
}
