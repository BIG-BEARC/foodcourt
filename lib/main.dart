import 'package:flutter/material.dart';
import 'package:foodcourt/core/viewmodel/favorite_model.dart';
import 'package:foodcourt/core/viewmodel/meal_view_model.dart';

import 'package:foodcourt/ui/share/them.dart';
import 'package:provider/provider.dart';
import 'ui/share/size_fit.dart';

import 'core/router/router.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => FCMealViewModel()),
      ChangeNotifierProvider(create: (ctx) => FCFavoriteViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return MaterialApp(
      title: '美食广场',
      theme: AppTheme.theme,
      initialRoute: Routers.initialRoute,
      routes: Routers.routes,
      onUnknownRoute: Routers.unKnownRoute,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
