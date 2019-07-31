import 'package:flutter_trip/model/home_model.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeModel") {
      return HomeModel.fromJson(json) as T;
    } else {
      return null;
    }
  }
}