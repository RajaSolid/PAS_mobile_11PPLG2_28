import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/models/tvshow_model.dart';

class FavoriteController extends GetxController {
  var favoriteList = <TVshowmodel>[].obs;

  void toggleFavorite(TVshowmodel show) {
    if (favoriteList.contains(show)) {
      favoriteList.remove(show);
    } else {
      favoriteList.add(show);
    }
  }

  bool isFavorite(TVshowmodel show) {
    return favoriteList.contains(show);
  }
}
