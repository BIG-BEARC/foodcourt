import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/base_view_model.dart';

class FCFavoriteViewModel extends BaseViewModel {


  void addFavoriteMealList(FCMealModel mealModel) {
    originMeals.add(mealModel);
    notifyListeners();
  }

  void removeFavoriteMealList(FCMealModel mealModel) {
    originMeals.remove(mealModel);
    notifyListeners();
  }

  void handleFavoriteMealList(FCMealModel mealModel) {
    if (originMeals.contains(mealModel)) {
      removeFavoriteMealList(mealModel);
    } else {
      addFavoriteMealList(mealModel);
    }
  }

  bool isFavoriteMeal(FCMealModel mealModel){
    return originMeals.contains(mealModel);
  }
}
