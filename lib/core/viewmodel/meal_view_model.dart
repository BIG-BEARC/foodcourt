import 'package:flutter/material.dart';

import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/services/meal_request.dart';

class FCMealViewModel extends ChangeNotifier {
  List<FCMealModel> _meal=[];


  List<FCMealModel> get meals => _meal;

  FCMealViewModel() {
    FCMealRequest.getMealData().then((value) {
      _meal = value;
      notifyListeners();
    });
  }
}
