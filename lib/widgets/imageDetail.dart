import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view.dart';
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
    return Scaffold(
        body: Container(
            height: size.height,
            color: theme.primaryColorLight,
            padding: EdgeInsets.all(5),
            child: Stack(
              children: [
                PhotoView(
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: image.id,
                    transitionOnUserGestures: true,
                  ),
                  imageProvider: CachedNetworkImageProvider(image.urls.regular),
                  backgroundDecoration:
                      BoxDecoration(color: theme.primaryColorLight),
                ),
              ],
            )));
  }
}
