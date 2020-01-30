import '../data/filters.dart';
import '../data/meals.dart';
import '../data/mealsFiltered.dart';

class FilterUtils {
  //SINGLETON STRUCTURE
  static FilterUtils _instance;

  FilterUtils._internalConstructor();

  factory FilterUtils() {
    _instance ??= FilterUtils._internalConstructor();
    return _instance;
  }

  void updater(
    bool _isGlutenFree,
    _isLactoseFree,
    _isVegan,
    _isVegetarian,
  ) {
    Map<String, bool> _filterMeals = {
      'isGlutenFree': _isGlutenFree,
      'isLactoseFree': _isLactoseFree,
      'isVegan': _isVegan,
      'isVegetarian': _isVegetarian
    };

    dbFilters = _filterMeals;

    var _mealsAfterFiltering = DB_MEALS.where((meal) {
      if (_filterMeals['isGlutenFree'] && !meal.isGlutenFree) return false;
      if (_filterMeals['isLactoseFree'] && !meal.isLactoseFree) return false;
      if (_filterMeals['isVegan'] && !meal.isVegan) return false;
      if (_filterMeals['isVegetarian'] && !meal.isVegetarian) return false;
      return true;
    }).toList();

    dbFilterMeals = _mealsAfterFiltering;
  }
}
