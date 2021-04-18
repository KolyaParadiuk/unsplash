import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/hooks/useSize.dart';
import 'package:unsplash/models/photo.dart';

class ImageDetail extends HookWidget {
  final Photo image;
  ImageDetail({required this.image});
  @override
  Widget build(BuildContext context) {
    var theme = useTheme();
    var size = useSize();
    return Container(
      height: size.height,
        color: theme.primaryColorLight.withOpacity(0.7),
        padding: EdgeInsets.all(5),
        child: ClipRRect(child: Hero(tag: image.id, child: Image.network(image.urls.small))));
  }
}