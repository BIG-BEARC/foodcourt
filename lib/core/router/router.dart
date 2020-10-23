import 'package:flutter/material.dart';

import 'package:foodcourt/ui/pages/err/unkonwn_page.dart';
import 'package:foodcourt/ui/pages/favorite/favorite.dart';
import 'package:foodcourt/ui/pages/home/home.dart';
import 'package:foodcourt/ui/pages/main/main.dart';

class Routers {
  static final String initialRoute = FCMainScreen.routeName;

  static RouteFactory unKnownRoute = (setting) {
    return MaterialPageRoute(builder: (ctx) {
      return UnKnownPage();
    });
  };

  static RouteFactory generateRoute = (setting) {
    return null;
  };

  static final Map<String, WidgetBuilder> routes = {
    FCMainScreen.routeName: (ctx) => FCMainScreen(),
  };
}
