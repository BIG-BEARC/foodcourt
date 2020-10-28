import 'package:flutter/material.dart';

import 'package:foodcourt/core/model/category.dart';
import 'package:foodcourt/ui/pages/meal/meal_item.dart';

class FCMealScreen extends StatelessWidget {
  static const String routeName = '/FCMealScreen';
  @override
  Widget build(BuildContext context) {
    final categoryModel = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.title),
      ),
      body: FCMealContent(),
    );
  }
}
