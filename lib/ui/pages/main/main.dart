import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/main/initialize_item.dart';
import 'package:foodcourt/ui/pages/main/main_drawer.dart';
import 'package:foodcourt/ui/share/umeng_report_events.dart';
import 'package:umeng_sdk/umeng_sdk.dart';




class FCMainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _FCMainScreenState createState() => _FCMainScreenState();
}

class _FCMainScreenState extends State<FCMainScreen> {
  int _currentIndex = 0;
@override
  void initState() {
    super.initState();
    UmengReportEvents.init();
    UmengSdk.onEvent('myevent', {'name':'jack', 'age':18, 'male':true});
    }
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
