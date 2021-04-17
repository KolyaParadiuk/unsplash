import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/states/api.dart';
import 'package:unsplash/widgets/feedImageList.dart';

class ImageFeedScreen extends HookWidget {
  static const navigationKey = "imageFeed";
  @override
  Widget build(BuildContext context) {
    var api = useApi().api;
    var currentPage = useState(1);
    var images = useState<List<Photo>>([]);
    var loading = useState(true);
    loadImages() async {
      loading.value = true;
      images.value.addAll(await api.getImages(currentPage.value, 30));
      loading.value = false;
    }

    onScrollReachEndOfPage() {
      currentPage.value = currentPage.value + 1;
    }

    useEffect(() {
      loadImages();
    }, [currentPage.value]);
    if (loading.value && currentPage.value == 1)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Scaffold(
      body: FeedImageList(
          images: images.value,
          onEndReached: onScrollReachEndOfPage,
          loading: loading.value),
    );
  }
}
