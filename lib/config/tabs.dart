import '../config/titles_icons.dart';
import '../screens/category_menu.dart';
import '../screens/favorites.dart';

class TabPages {
  static Map<String, Object> titles = TitlesAndIcons().tabs;

  List<Map<String, Object>> get getTabPages {
    return [
      {
        'page': ScreenCategoryMenu(),
        'title': titles['categoryTitle'],
      },
      {'page': ScreenFavorites(), 'title': titles['favoriteTitle']}
    ];
  }
}
