import 'package:flutter/material.dart';

import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/services/meal_request.dart';
import 'package:foodcourt/core/viewmodel/base_view_model.dart';

class FCMealViewModel extends BaseViewModel {



  FCMealViewModel() {
    FCMealRequest.getMealData().then((value) {
      meal = value;
      notifyListeners();
    });
  }
}
