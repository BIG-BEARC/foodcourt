import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/favorite/favorite.dart';
import 'package:foodcourt/ui/pages/home/home.dart';
import 'package:foodcourt/ui/pages/main/initialize_item.dart';
import 'package:foodcourt/ui/pages/main/main_drawer.dart';

class FCMainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _FCMainScreenState createState() => _FCMainScreenState();
}

class _FCMainScreenState extends State<FCMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FCMainDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: bottomBarItems,
        currentIndex: _currentIndex,
        onTap: (index) {
         setState(() {
           _currentIndex = index;
         });
        },
      ),
    );
  }
}
