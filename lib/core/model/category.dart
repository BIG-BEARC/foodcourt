import 'package:flutter/cupertino.dart';

/// id : "c1"
/// title : "意大利"
/// color : "9C27B0"

class CategoryModel {
  String _id;
  String _title;
  String _color;
  Color _cColor;

  String get id => _id;
  String get title => _title;
  String get color => _color;
  Color get cColor=>_cColor;

  CategoryModel(this._id, this._title, this._color);

  CategoryModel.map(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._color = obj["color"];
    // 1.将color转成十六进制的数字
    // final colorInt = int.parse(color, radix: 16);
    // // 2.将透明度加进去
    // cColor = Color(colorInt | 0xFF000000);
    this._cColor = Color(int.parse(_color,radix:16)|0xFF000000);
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["title"] = _title;
    map["color"] = _color;
    return map;
  }

}