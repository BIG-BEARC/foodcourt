import 'package:flutter/material.dart';

import 'package:foodcourt/core/extension/int_extension.dart';
class FCOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _content;

  FCOperationItem(this._icon, this._content);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      _icon,
      SizedBox(width: 3.px,),
      Text(_content)
    ],);
  }
}
