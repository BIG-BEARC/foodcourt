import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/extension/int_extension.dart';

class FCDetailContent extends StatelessWidget {
  final FCMealModel mealModel;

  FCDetailContent({@required this.mealModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMarkBannerImg(),
          _buildMarkTitle(context: context, title: '制作材料'),
          _buildMarkMaterial(),
          _buildMarkTitle(context: context, title: '制作步骤'),
          _buildMarkSteps(),
        ],
      ),
    );
  }

  Widget _buildMarkBannerImg() {
    return FadeInImage(
        fit: BoxFit.cover,
        width: double.infinity,
        height: 250.px,
        placeholder: AssetImage('assets/images/juren.jpeg'),
        image: NetworkImage(mealModel.imageUrl));
  }

  Widget _buildMarkTitle(
      {@required BuildContext context, @required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline3
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMarkMaterial() {
    return _buildMarkContent(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: mealModel.ingredients.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.px, horizontal: 8.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.px)),
                      color: Colors.orange,
                    ),
                    child: Text(mealModel.ingredients[index])),
              );
            }));
  }

  Widget _buildMarkSteps() {
    return _buildMarkContent(
        child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mealModel.steps.length,
              itemBuilder: (ctx,index){
                return ListTile(
                  leading: CircleAvatar(child: Text("#${index+1}"),),
                  title: Text(mealModel.steps[index]),
                );
              },
              separatorBuilder: (ctx,index){
                return Divider();
              },
    ));
  }

  Widget _buildMarkContent({@required Widget child}) {
    return Card(
      color: Colors.white24,
      margin: EdgeInsets.symmetric(horizontal: 10.px),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(8.px))),
      elevation: 8.px,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.px),
        child: child,
      ),
    );
  }
}
