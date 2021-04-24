import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/widgets/feedImage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedImageList extends HookWidget {
  final List<Photo> images;
  final Function onEndReached;
  final Function onRefresh;
  final Function hideAppbar;
  final Function showAppbar;


  FeedImageList({
    required this.images,
    required this.onEndReached,
    required this.onRefresh,
    required this.hideAppbar,
    required this.showAppbar

  });
  @override
  Widget build(BuildContext context) {
    var scrollController = useState(ScrollController());
    void scrollListener() async {
      if (scrollController.value.position.extentAfter < 1000) {
        this.onEndReached();
      }
      switch (scrollController.value.position.userScrollDirection) {
      case ScrollDirection.forward:
        showAppbar();
        break;
      case ScrollDirection.reverse:
        hideAppbar();
        break;
      case ScrollDirection.idle:
        break;
    }
    }

    useEffect(() {
      scrollController.value.addListener(scrollListener);
    }, []);




    return RefreshIndicator(
          onRefresh: () async {
          return await this.onRefresh();
        },
        child: StaggeredGridView.count(
          controller: scrollController.value,
          crossAxisCount: 4,
          children: images.map((i) => FeedImage(image: i)).toList(),
          staggeredTiles: images.map((i) => StaggeredTile.fit(2)).toList(),
          )
    );
  }
}
