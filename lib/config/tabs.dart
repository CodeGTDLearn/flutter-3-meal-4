import '../config/titles_icons.dart';
import '../entity/meal.dart';
import '../screens/category_menu.dart';
import '../screens/favorites.dart';

class TabPages {
  final List<Meal> _favoriteMeals;
  static Map<String, Object> titles = TitlesAndIcons().tabs;

  TabPages(this._favoriteMeals);

  List<Map<String, Object>> get getTabPages {
    return [
      {
        'page': ScreenCategoryMenu(),
        'title': titles['categoryTitle'],
      },
      {
        'page': ScreenFavorites(_favoriteMeals),
        'title': titles['favoriteTitle']
      }
    ];
  }
}
