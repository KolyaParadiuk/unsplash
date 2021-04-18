import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view.dart';
import 'package:unsplash/hooks/navigation.dart';
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
    var navigator = useNavigation();
    return Scaffold(
        body: Stack(
      children: [
        GestureDetector(
          onPanUpdate: (details) {
            navigator.pop();
          },
          child: Container(
              height: size.height,
              color: theme.primaryColorLight,
              padding: EdgeInsets.all(5),
              child: Stack(
                children: [
                  PhotoView(
                    gestureDetectorBehavior: HitTestBehavior.translucent,
                    heroAttributes: PhotoViewHeroAttributes(
                      tag: image.id,
                      transitionOnUserGestures: true,
                    ),
                    imageProvider: NetworkImage(image.urls.small),
                    backgroundDecoration:
                        BoxDecoration(color: theme.primaryColorLight),
                  ),
                ],
              )),
        ),
        Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              onPressed: navigator.pop,
              icon: Icon(Icons.arrow_back_ios),
            )),
      ],
    ));
  }
}
