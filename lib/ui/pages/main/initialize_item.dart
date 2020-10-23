import 'package:flutter/material.dart';

import 'package:foodcourt/ui/pages/favorite/favorite.dart';
import 'package:foodcourt/ui/pages/home/home.dart';

final List<Widget> pages = [
  FCHomeScreen(),
  FCFavoriteScreen(),
];

final List<BottomNavigationBarItem> bottomBarItems =[
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
  BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('收藏')),
];