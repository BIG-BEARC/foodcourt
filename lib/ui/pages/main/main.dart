import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/favorite/favorite.dart';
import 'package:foodcourt/ui/pages/home/home.dart';
import 'package:foodcourt/ui/pages/main/initialize_item.dart';

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
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
