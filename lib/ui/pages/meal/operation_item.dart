import 'package:flutter/material.dart';

import 'package:foodcourt/core/extension/int_extension.dart';
class FCOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _content;

  FCOperationItem(this._icon, this._content);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 16.px,horizontal: 8.px),
      width: 80.px,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        _icon,
        SizedBox(width: 3.px,),
        Text(_content,style: TextStyle(),)
      ],),
    );
  }
}
