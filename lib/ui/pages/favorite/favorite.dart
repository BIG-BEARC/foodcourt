import 'package:flutter/material.dart';

import 'favorite_content.dart';

class FCFavoriteScreen extends StatefulWidget {
  static const String routeName ='FCFavoriteScreen';
  @override
  _FCFavoriteScreenState createState() => _FCFavoriteScreenState();
}

class _FCFavoriteScreenState extends State<FCFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
      ),
      body: FCFavoriteContent(),
    );
  }
}
