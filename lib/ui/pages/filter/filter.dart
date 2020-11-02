import 'package:flutter/material.dart';

import 'filter_content.dart';
class FCFilterScreen extends StatelessWidget {
  static const String routeName = '/FCFilterScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食过滤'),
      ),
      body: FCFilterContent(),
    );
  }
}

