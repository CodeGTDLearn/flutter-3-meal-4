import 'package:flutter/material.dart';

class TitlesAndIcons {
  Map<String, Object> _tabs = {
    'categoryTitle': "Categories",
    'categoryIcon': Icons.category,
    'favoriteTitle': "Favorites",
    'favoriteIcon': Icons.favorite,
  };

  Map<String, Object> _drawers = {
    'mealsTitle': "Meals",
    'mealsIcon': Icons.restaurant,
    'settingsTitle': "Settings",
    'settingsIcon': Icons.settings,
  };

  Map<String, Object> _mealDetails = {
    'favorite': Icons.favorite,
    'unFavorite': Icons.favorite_border
  };

  Map<String, Object> get tabMenus => _tabs;

  Map<String, Object> get drawer => _drawers;

  Map<String, Object> get favorite => _mealDetails;
}
