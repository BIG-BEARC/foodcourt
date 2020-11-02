import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/home/home_content.dart';

class FCHomeScreen extends StatefulWidget {
  static const String routeName ='FCHomeScreen';
  @override
  _FCHomeScreenState createState() => _FCHomeScreenState();
}

class _FCHomeScreenState extends State<FCHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),
        onPressed: (){
          Scaffold.of(context).openDrawer();
        },),
        title: Text('美食广场'),
        centerTitle: true,
      ),
      body: FCHomeContent(),
    );
  }
}
