import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/category.dart';
import 'package:foodcourt/core/services/json_parse.dart';
import 'package:foodcourt/core/extension/int_extension.dart';

import 'home_content_item.dart';

class FCHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
        future: JsonParse.getCategoryJsonParseData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError)
            return Center(
              child: Text('加载失败!'),
            );

          var categoryModels = snapshot.data;

          return Container(
            alignment: Alignment.center,
            child: GridView.builder(
              padding: EdgeInsets.all(10.px),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
              ),
              itemCount: categoryModels.length,
              itemBuilder: (ctx, index) {
                return FCHomeContentItem(categoryModels[index]);
              },
            ),
          );
        });
  }
}
