import '../config/titles_icons.dart';
import '../views/category_menu.dart';
import '../views/favorites.dart';

class TabPages {
  static Map<String, Object> titles = TitlesAndIcons().tabs;

  List<Map<String, Object>> get getTabPages {
    return [
      {'page': ViewCategoryMenu(), 'title': titles['categoryTitle']},
      {'page': ViewFavorites(), 'title': titles['favoriteTitle']}
    ];
  }
}
