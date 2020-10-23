import 'package:flutter/material.dart';
import 'package:foodcourt/ui/share/them.dart';

import 'core/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
