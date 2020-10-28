import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/category.dart';
import 'package:foodcourt/core/services/json_parse.dart';
import 'package:foodcourt/core/extension/int_extension.dart';

import 'home_content_item.dart';
class FCHomeContent extends StatefulWidget {
  @override
  _FCHomeContentState createState() => _FCHomeContentState();
}

class _FCHomeContentState extends State<FCHomeContent> {
  List<CategoryModel> _categoryModels = [];

  @override
  void initState() {
    super.initState();
    JsonParse.getCategoryJsonParseData().then((value) {
      setState(() {
        _categoryModels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        itemCount: _categoryModels.length,
        itemBuilder: (ctx, index) {
          return FCHomeContentItem(_categoryModels[index]);
        },
      ),
    );
  }
}
