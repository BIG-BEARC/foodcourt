import 'package:flutter/material.dart';

import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/extension/int_extension.dart';
import 'package:foodcourt/core/viewmodel/favorite_model.dart';
import 'package:foodcourt/ui/pages/detail/detail.dart';
import 'package:foodcourt/ui/pages/meal/operation_item.dart';
import 'package:provider/provider.dart';

class FCMealItem extends StatelessWidget {
  final FCMealModel _mealModel;

  FCMealItem(this._mealModel);

  final _circular = 12.px;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(_circular))),
        elevation: 8,
        child: Column(
          children: [
            _buildBasicInfo(context),
            _buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(FCDetailScreen.routeName, arguments: _mealModel);
      },
    );
  }

  Widget _buildBasicInfo(context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_circular),
              topRight: Radius.circular(_circular)),
          child: FadeInImage(
              width: double.infinity,
              height: 250.px,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/juren.jpeg'),
              image: NetworkImage(
                _mealModel.imageUrl,
              )),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(6.px))),
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            child: Text(
              _mealModel.title,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOperationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FCOperationItem(Icon(Icons.access_time), "${_mealModel.duration} min"),
        FCOperationItem(Icon(Icons.restaurant), _mealModel.complexityStr),
        _buildFavorItem(),
      ],
    );
  }

  Widget _buildFavorItem() {
    return Consumer<FCFavoriteViewModel>(builder: (ctx,favoriteVM,child){
      // 1.判断是否收藏状态
      final iconData = favoriteVM.isFavoriteMeal(_mealModel) ? Icons.favorite: Icons.favorite_border;
      final favorColor = favoriteVM.isFavoriteMeal(_mealModel) ? Colors.red: Colors.black;
      final title = favoriteVM.isFavoriteMeal(_mealModel)? "收藏  ": "未收藏";
      return GestureDetector(
        child:  FCOperationItem(Icon(iconData,color: favorColor,), title),
        onTap: (){
          favoriteVM.handleFavoriteMealList(_mealModel);
        },
      );
    });
  }
}
