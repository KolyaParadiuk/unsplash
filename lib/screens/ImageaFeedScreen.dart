import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/hooks/useSize.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/states/api.dart';
import 'package:unsplash/widgets/appbar.dart';
import 'package:unsplash/widgets/feedImageList.dart';

class ImageFeedScreen extends HookWidget {
  static const navigationKey = "imageFeed";
  @override
  Widget build(BuildContext context) {
    var api = useApi().api;
    var theme = useTheme();
    var size = useSize();
    var currentPage = useState(1);
    var images = useState<List<Photo>>([]);
    var searchQuery = useState('');
    var loading = useState(true);
    loadRegularImages() async {
      loading.value = true;
      images.value.addAll(await api.getImages(currentPage.value, 30));
      loading.value = false;
    }

    loadSearchedImages() async {
      loading.value = true;
      images.value.addAll(
          await api.searchImages(searchQuery.value, currentPage.value, 30));
      loading.value = false;
    }

    onScrollReachEndOfPage() {
      currentPage.value = currentPage.value + 1;
    }

    var loadImages = useState(loadRegularImages);

    onSearchSubmited(String s) {
      loading.value = true;
      currentPage.value = 1;
      images.value = [];
      searchQuery.value = s;
      if (s == "") return loadImages.value = loadRegularImages;
      loadImages.value = loadSearchedImages;
    }

    useEffect(() {
      loadImages.value();
    }, [currentPage.value, searchQuery.value]);

    loadingPalceholder() => loading.value && currentPage.value == 1
        ? Container(
            width: size.width,
            height: size.height,
            color: theme.primaryColorLight.withOpacity(0.5),
            child: Center(child: CircularProgressIndicator()))
        : Container();

    // if (loading.value && currentPage.value == 1)
    //   return Container(
    //       width: size.width,
    //       height: size.height,
    //       color: theme.primaryColorLight.withOpacity(0.5),
    //       child: Center(child: CircularProgressIndicator()));
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).padding.top + 70),
          child: SearchBar(
            onSearch: onSearchSubmited,
          )),
      body: Stack(
        children: [
          FeedImageList(
              images: images.value,
              onEndReached: onScrollReachEndOfPage,
              loading: loading.value),
          loadingPalceholder()
        ],
      ),
    );
  }
}
