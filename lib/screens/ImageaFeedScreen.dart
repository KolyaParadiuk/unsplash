import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';
import 'package:unsplash/hooks/useSize.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/states/api.dart';
import 'package:unsplash/widgets/appbar.dart';
import 'package:unsplash/widgets/error.dart';
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
    var error = useState(false);

    loadRegularImages() async {
      loading.value = true;
      try {
        images.value.addAll(await api.getImages(currentPage.value, 30));
      } catch (e) {
        error.value = true;
      } finally {
        loading.value = false;
      }
    }

    loadSearchedImages() async {
      loading.value = true;
      try {
        images.value.addAll(
            await api.searchImages(searchQuery.value, currentPage.value, 30));
      } catch (e) {
        error.value = true;
      } finally {
        loading.value = false;
      }
      loading.value = false;
    }

    onScrollReachEndOfPage() {
      if (!loading.value) {
        loading.value = true;
        currentPage.value = currentPage.value + 1;
      }
    }

    var loadImages = useState(loadRegularImages);

    onSearchSubmited(String s) {
      FocusScope.of(context).unfocus();
      if (s != searchQuery.value) {
        loading.value = true;
        currentPage.value = 1;
        images.value = [];
        searchQuery.value = s;
        if (s == "") return loadImages.value = loadRegularImages;
        loadImages.value = loadSearchedImages;
      }
    }

    onRefresh() async {
      loading.value = true;
      currentPage.value = currentPage.value + 1;
      images.value = [];
    }

    useEffect(() {
      loadImages.value();
    }, [currentPage.value, searchQuery.value]);
    if (error.value) return ServerError();
    if (loading.value && currentPage.value == 1)
      return Container(
          width: size.width,
          height: size.height,
          color: theme.primaryColorLight,
          child: Center(child: CircularProgressIndicator()));
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
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
            onRefresh: onRefresh,
          ),
        ],
      ),
    );
  }
}
