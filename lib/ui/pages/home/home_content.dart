import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/Category.dart';
import 'package:foodcourt/core/services/json_parse.dart';

class FCHomeContent extends StatefulWidget {
  @override
  _FCHomeContentState createState() => _FCHomeContentState();
}

class _FCHomeContentState extends State<FCHomeContent> {
  List<CategoryModel> categorys = [];

  @override
  void initState() {
    super.initState();
    JsonParse.getCategoryJsonParseData().then((value) {
      setState(() {
        categorys = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,),
        itemCount: categorys.length,
        itemBuilder: (ctx,index){
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red
            ),
            child: Text(categorys[index].title,style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold
            ),),
          );
        },
      ),
    );
  }
}
