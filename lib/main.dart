import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'ui/share/size_fit.dart';
import 'ui/share/them.dart';

import 'core/viewmodel/filter_view_model.dart';
import 'core/router/router.dart';
import 'core/viewmodel/favorite_model.dart';
import 'core/viewmodel/meal_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => FCFilterViewModel()),
      ChangeNotifierProxyProvider<FCFilterViewModel, FCMealViewModel>(
          create: (ctx) {
        return FCMealViewModel();
      }, update: (ctx, filterVM, mealVM) {
        mealVM.updateFilters(filterVM);
        return mealVM;
      }),
      ChangeNotifierProxyProvider<FCFilterViewModel, FCFavoriteViewModel>(
          create: (ctx) => FCFavoriteViewModel(),
          update: (ctx, filterVM, favoriteVM) {
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
      title: 'Food Court',
      theme: AppTheme.theme,
      initialRoute: Routers.initialRoute,
      routes: Routers.routes,
      onUnknownRoute: Routers.unKnownRoute,
      onGenerateRoute: Routers.generateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
       S.delegate
      ],
      supportedLocales: [
        Locale('en'),
        Locale('zh'),
         Locale.fromSubtags(languageCode: 'zh')
      ],

    );
  }
}
