import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodcourt/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class FCFilterContent extends StatefulWidget {
  @override
  _FCFilterContentState createState() => _FCFilterContentState();
}

class _FCFilterContentState extends State<FCFilterContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text('展示你的选择', style: Theme
              .of(context)
              .textTheme
              .headline3
              .copyWith(fontWeight: FontWeight.bold),),
        ),
        Expanded(
            child: Consumer<FCFilterViewModel>(builder: (ctx, filterVM, child) {
              return ListView(
                children: [buildListTile(title: '无谷蛋白', subtitle: '无谷蛋白',curState: filterVM.isGlutenFree,
                change: (value){
                  filterVM.isGlutenFree=value;
                }),
                  buildListTile(title: '不含乳糖', subtitle: '不含乳糖',curState: filterVM.isLactoseFree,
                      change: (value){
                        filterVM.isLactoseFree=value;
                      }),
                  buildListTile(title: '素食主义', subtitle: '素食主义',curState: filterVM.isVegetarian,
                      change: (value){
                        filterVM.isVegetarian=value;
                      }),
                  buildListTile(title: '严格素食主义', subtitle: '严格素食主义',curState: filterVM.isVegan,
                      change: (value){
                        filterVM.isVegan=value;
                      }),
                ],
              );
            }))
      ],
    );
  }
}

Widget buildListTile({@required String title,
  @required String subtitle,
  @required bool curState,
  @required Function change}) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Switch(value: curState, onChanged: change),
  );
}