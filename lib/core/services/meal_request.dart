import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/services/http_request.dart';

class FCMealRequest{
  static Future<List<FCMealModel>> getMealData() async{
    final url = '/meal';
    final result = await HttpRequest.request(url);
    final resultStr = result['meal'];

    List<FCMealModel> list = [];
    for(var json in resultStr){
      list.add(FCMealModel.fromJson(json));
    }
    return list;
  }
}