import 'package:flutter/material.dart';
import 'package:foodcourt/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

import 'package:foodcourt/ui/share/them.dart';
import 'ui/share/size_fit.dart';

import 'core/router/router.dart';
import 'package:foodcourt/core/viewmodel/favorite_model.dart';
import 'package:foodcourt/core/viewmodel/meal_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
/*      ChangeNotifierProvider(create: (ctx) => FCMealViewModel()),
      ChangeNotifierProvider(create: (ctx) => FCFavoriteViewModel()),*/
      ChangeNotifierProvider(create: (ctx) => FCFilterViewModel()),
      ChangeNotifierProxyProvider<FCFilterViewModel, FCMealViewModel>(
          create: (ctx) {
        return FCMealViewModel();
      }, update: (ctx, filterVM, mealVM) {
        mealVM.updateFilters(filterVM);
        return mealVM;
      }),
      ChangeNotifierProxyProvider<FCFilterViewModel,FCFavoriteViewModel>(create: (ctx)=>FCFavoriteViewModel(),
          update: (ctx,filterVM,favoriteVM){
        favoriteVM.updateFilters(filterVM);
        return favoriteVM;
          })
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
