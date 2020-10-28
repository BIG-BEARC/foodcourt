import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodcourt/core/model/category.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/meal_view_model.dart';

import 'package:foodcourt/ui/widgets/meal_item.dart';


class FCMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryModel = ModalRoute
        .of(context)
        .settings
        .arguments as CategoryModel;

    return Selector<FCMealViewModel, List<FCMealModel>>(
        selector: (ctx, mealVM) =>
            mealVM.meals.where((value) =>
                value.categories.contains(categoryModel.id))
                .toList(),
        shouldRebuild: (prev, nex) => true,
        builder: (ctx, meals, child) {
          return ListView.builder(itemBuilder: (ctx, index) {
            return FCMealItem(meals[index]);
          },
            itemCount: meals.length,
          );
        });
  }
}
