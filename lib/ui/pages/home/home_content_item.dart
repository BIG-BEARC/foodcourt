import 'package:flutter/material.dart';

import 'package:foodcourt/core/extension/int_extension.dart';
import 'package:foodcourt/core/extension/double_extension.dart';
import 'package:foodcourt/core/model/category.dart';
///首页列表 Item
class FCHomeContentItem extends StatelessWidget{
  final CategoryModel _categoryModel;

  FCHomeContentItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
   return Container(
     alignment: Alignment.center,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12.px),
         gradient: LinearGradient(colors: [
           _categoryModel.cColor.withOpacity(.5),
           _categoryModel.cColor,
         ])),
     child: Text(
       _categoryModel.title,
       style: Theme.of(context)
           .textTheme
           .bodyText2
           .copyWith(fontWeight: FontWeight.bold),
     ),
   );
  }

}