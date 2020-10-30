import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/favorite_model.dart';
import 'package:foodcourt/ui/pages/detail/detail_content.dart';
import 'package:provider/provider.dart';

class FCDetailScreen extends StatefulWidget {
  static const String routeName = '/FCDetailScreen';

  @override
  _FCDetailScreenState createState() => _FCDetailScreenState();
}

class _FCDetailScreenState extends State<FCDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as FCMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: FCDetailContent(
        mealModel: meal,
      ),
      floatingActionButton:
          Consumer<FCFavoriteViewModel>(builder: (ctx, favoriteVM, child) {
                final favoriteColor = favoriteVM.isFavoriteMeal(meal)?Colors.pinkAccent:Colors.grey;
                final favoriteIcon = favoriteVM.isFavoriteMeal(meal)?Icons.favorite:Icons.favorite_border;

                return FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      favoriteVM.handleFavoriteMealList(meal);
                    });
                  },
                  child: Icon(favoriteIcon,color: favoriteColor,),
                );
              }),
    );
  }
}
