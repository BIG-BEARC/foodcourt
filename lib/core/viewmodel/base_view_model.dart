import 'package:flutter/cupertino.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/filter_view_model.dart';
import 'package:foodcourt/core/viewmodel/meal_view_model.dart';

class BaseViewModel extends ChangeNotifier {
  List<FCMealModel> _meal = [];
  FCFilterViewModel _filterVM;

  set meal(List<FCMealModel> value) {
    _meal = value;
    notifyListeners();
  }

  List<FCMealModel>  get meals {
    return _meal.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<FCMealModel> get originMeals {
    return _meal;
  }

  void updateFilters(FCFilterViewModel filterVM) {
    _filterVM = filterVM;
  }
}
