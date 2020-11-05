import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodcourt/ui/widgets/meal_item.dart';

import 'package:foodcourt/core/extension/int_extension.dart';
import 'package:foodcourt/core/viewmodel/favorite_model.dart';
class FCFavoriteContent extends StatefulWidget {
  @override
  _FCFavoriteContentState createState() => _FCFavoriteContentState();
}

class _FCFavoriteContentState extends State<FCFavoriteContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Consumer<FCFavoriteViewModel>(builder: (ctx,favoriteVM,child){
        if(favoriteVM.meals.isEmpty)return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/juren.jpeg'),
              SizedBox(height: 5.px,),
              Text('暂无数据',style: Theme.of(context).textTheme.headline3,)
            ],
          ),
        );
        return ListView.builder(
            itemCount: favoriteVM.meals.length,
            itemBuilder: (context,index){
          return FCMealItem(favoriteVM.meals[index]);
        });
      }),
    );
  }
}
