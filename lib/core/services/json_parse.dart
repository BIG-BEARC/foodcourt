import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodcourt/core/model/category.dart';

class JsonParse {
  ///获取分类数据
  static Future<List<CategoryModel>> getCategoryJsonParseData() async {
    List<CategoryModel> categories = [];
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    // 2.将jsonString转成Map/List
    final result = json.decode(jsonString);
    // 3.将Map中的内容转成一个个对象
    final resultList = result['category'];
    for (var item in resultList) {
      categories.add(CategoryModel.map(item));
    }

    return categories;
  }
}
