import '../config/filters.dart';
import '../data/meals.dart';
import '../entity/meal.dart';

class FiltersManagement {
  //SINGLETON STRUCTURE
  static FiltersManagement _instance;

  FiltersManagement._internalConstructor();

  factory FiltersManagement() {
    _instance ??= FiltersManagement._internalConstructor();
    return _instance;
  }

  FiltersManagement.updateFilters(this._updatedFilters); //SINGLETON STRUCTURE

  Map<String, bool> _myAppFilters = FILTERS;
  List<Meal> _displayedMeals = DB_MEALS;
  Map<String, bool> _updatedFilters;

  void myAppUpdateFilter(Map<String, bool> _updatedFilters) {
    this._myAppFilters = _updatedFilters;
    this._displayedMeals = DB_MEALS.where((meal) {
      if (this._myAppFilters['isGlutenFree'] && !meal.isGlutenFree)
        return false;
      if (this._myAppFilters['isLactoseFree'] && !meal.isLactoseFree)
        return false;
      if (this._myAppFilters['isVegan'] && !meal.isVegan) return false;
      if (this._myAppFilters['isVegetarian'] && !meal.isVegetarian)
        return false;
      return true;
    }).toList();
  }

  Map<String, bool> get getMyAppFilters => _myAppFilters;

  Map<String, bool> get getUpdatedFilters => _updatedFilters;

  List<Meal> get getDisplayedMeals => _displayedMeals;
}
