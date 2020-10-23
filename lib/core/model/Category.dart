/// id : "c1"
/// title : "意大利"
/// color : "9C27B0"

class CategoryModel {
  String _id;
  String _title;
  String _color;

  String get id => _id;
  String get title => _title;
  String get color => _color;

  CategoryModel(this._id, this._title, this._color);

  CategoryModel.map(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._color = obj["color"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["title"] = _title;
    map["color"] = _color;
    return map;
  }

}