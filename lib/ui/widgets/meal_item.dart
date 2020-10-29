import 'package:flutter/material.dart';

import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/extension/int_extension.dart';
import 'package:foodcourt/ui/pages/detail/detail.dart';
import 'package:foodcourt/ui/pages/meal/operation_item.dart';

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
      onTap: (){
        Navigator.of(context).pushNamed(FCDetailScreen.routeName,arguments: _mealModel);
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
          //todo 未使用 placeholder
          child: Image.network(
            _mealModel.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FCOperationItem(Icon(Icons.access_time), "${_mealModel.duration} min"),
          FCOperationItem(Icon(Icons.restaurant), _mealModel.complexityStr),
          FCOperationItem(Icon(Icons.favorite), "未收藏"),
        ],
      ),
    );
  }
}
