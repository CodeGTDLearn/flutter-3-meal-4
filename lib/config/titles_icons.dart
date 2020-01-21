import 'package:flutter/material.dart';

class TitlesAndIcons {
//  static GlobalConfiguration _cfg;
//
//  TitlesAndIcons() {
//    _cfg = new GlobalConfiguration();
//  }

//TODO: Implantar SingleTon, antes de qquer coisa, e é logico testar

  final Map<String, Object> _tabs = {
    //'categoryTitle': _cfg.getString("categoryTitle"),
    'categoryTitle': "Categories",
    'categoryIcon': Icons.category,
    'favoriteTitle': "Favorites",
    'favoriteIcon': Icons.favorite,
  };

  final Map<String, Object> _drawers = {
    'title': "Cooking up!!",
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

  final Map<String, Object> _filters = {
    'AppbarTitle': 'Filters',
    'pageTitle': 'Filter your meal preferences',
    'glutTitle': 'Glutten Free',
    'glutSubtitle': 'Show only glutten free meals',
    'lactTitle': 'Lactose Free',
    'lactSubtitle': 'Show only lactose free meals',
    'vegeTitle': 'Vegetarian',
    'vegeSubtitle': 'Show only vegetarian meals',
    'veganTitle': 'Vegan',
    'veganSubtitle': 'Show only vegan meals',
  };

  Map<String, Object> get tabs => _tabs;

  Map<String, Object> get drawer => _drawers;

  Map<String, Object> get mealDetails => _mealDetails;

  Map<String, Object> get cardMealIcons => _cardMealIcons;

  Map<String, Object> get filters => _filters;
}
