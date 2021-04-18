import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/widgets/feedImage.dart';

class FeedImageList extends HookWidget {
  final List<Photo> images;
  final Function onEndReached;
  final Function onRefresh;


  FeedImageList({
    required this.images,
    required this.onEndReached,
    required this.onRefresh
  });
  @override
  Widget build(BuildContext context) {
    var scrollController = useState(ScrollController());
    var theme = useTheme();
    void scrollListener() async {
      if (scrollController.value.position.extentAfter < 1000) {
        this.onEndReached();
      }
    }

    useEffect(() {
      scrollController.value.addListener(scrollListener);
    }, []);
    List<List<Photo>> splitImagesToClumns() {
      List<Photo> firstCol = [];
      List<Photo> secondCol = [];
      images.forEach((i) {
        if (images.indexOf(i) % 2 == 1) {
          firstCol.add(i);
          return;
        }
        secondCol.add(i);
      });
      return [firstCol, secondCol];
    }

    imageColumn(List<Photo> images) {
      return Column(
        children: images.map((i) => FeedImage(image: i)).toList(),
      );
    }

    return RefreshIndicator(
          onRefresh: () async {
          return await this.onRefresh();
        },
        child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: scrollController.value,
        child: Container(
          color: theme.primaryColorLight,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              (Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    splitImagesToClumns().map((ic) => imageColumn(ic)).toList(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
