import 'package:flutter/material.dart';

class TitlesAndIcons {
  final Map<String, Object> _tabs = {
    'categoryTitle': "Categories",
    'categoryIcon': Icons.category,
    'favoriteTitle': "Favorites",
    'favoriteIcon': Icons.favorite,
  };

  final Map<String, Object> _drawers = {
    'mealsTitle': "Meals",
    'mealsIcon': Icons.restaurant,
    'settingsTitle': "Settings",
    'settingsIcon': Icons.settings,
  };

  final Map<String, Object> _mealDetails = {
    'favorite': Icons.favorite,
    'unFavorite': Icons.favorite_border,
    'ingredientsTitle': "Ingredients",
    'stepsTitle': "Steps",
  };

  final Map<String, Object> _cardMealIcons = {
    'duration': Icons.schedule,
    'complex': Icons.work,
    'afford': Icons.attach_money,
  };

  Map<String, Object> get tabs => _tabs;

  Map<String, Object> get drawer => _drawers;

  Map<String, Object> get mealDetails => _mealDetails;

  Map<String, Object> get cardMealIcons => _cardMealIcons;
}
