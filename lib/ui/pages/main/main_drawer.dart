import 'package:flutter/material.dart';

import 'package:foodcourt/core/extension/int_extension.dart';
import 'package:foodcourt/ui/pages/filter/filter.dart';
class FCMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), "进餐", () {
              Navigator.of(context).pop();
            }),
            buildListTile(context, Icon(Icons.settings), "过滤", () {
            Navigator.of(context).pushNamed(FCFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
  Widget buildListTile(BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline4,),
      onTap: handler,
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
      child: Text("开始动手", style: Theme
          .of(context)
          .textTheme
          .headline3),
    );
  }
}