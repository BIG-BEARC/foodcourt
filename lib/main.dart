import 'package:flutter/material.dart';
import 'package:foodcourt/ui/share/them.dart';

import 'core/router/router.dart';
import 'ui/share/size_fit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return MaterialApp(
      title: '美食广场',
      theme: AppTheme.theme,
      initialRoute:Routers.initialRoute ,
      routes: Routers.routes,
      onUnknownRoute:Routers.unKnownRoute ,
      onGenerateRoute:Routers.generateRoute ,
    );
  }
}
