import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';

class FCFavoriteViewModel extends ChangeNotifier {
   List<FCMealModel> favoriteMealList = [];

  List<FCMealModel> get favoriteList=> favoriteMealList;

  void addFavoriteMealList(FCMealModel mealModel) {
    favoriteMealList.add(mealModel);
    notifyListeners();
  }

  void removeFavoriteMealList(FCMealModel mealModel) {
    favoriteMealList.remove(mealModel);
    notifyListeners();
  }

  void handleFavoriteMealList(FCMealModel mealModel) {
    if (favoriteMealList.contains(mealModel)) {
      removeFavoriteMealList(mealModel);
    } else {
      addFavoriteMealList(mealModel);
    }
  }

  bool isFavoriteMeal(FCMealModel mealModel){
    return favoriteMealList.contains(mealModel);
  }
}
