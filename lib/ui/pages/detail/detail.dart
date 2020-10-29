import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/ui/pages/detail/detail_content.dart';

class FCDetailScreen extends StatelessWidget {
  static const String routeName = '/FCDetailScreen';
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as FCMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: FCDetailContent(mealModel: meal,),
    );
  }
}
