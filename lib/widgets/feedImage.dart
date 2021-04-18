import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/hooks/useSize.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/widgets/imageDetail.dart';

class FeedImage extends HookWidget {
  final Photo image;
  FeedImage({required this.image});
  @override
  Widget build(BuildContext context) {
    var width = useSize().width / 2 - 5;
    var theme = useTheme();
    onTap() {
      showMaterialModalBottomSheet(
        context: context,
        builder: (context) => ImageDetail(image: image),
      );
      
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: theme.primaryColorLight,
          padding: EdgeInsets.all(5),
          width: width,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Hero(
                  tag: image.id,
                  child: Image(
                      image: CachedNetworkImageProvider(image.urls.regular))))),
    );
  }
}
