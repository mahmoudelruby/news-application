import 'package:flutter/material.dart';
import 'package:news/main.dart';
import 'package:news/modal/source.dart';

class TabItem extends StatelessWidget {
  bool selected;
  Source source ;
  TabItem( this.selected, this.source);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Tab(

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),

        decoration: BoxDecoration(
          border: Border.all(color: MyThemeData.PrimaryColor, width: 3),
          borderRadius: BorderRadius.circular(30),
          color: selected
              ? MyThemeData.PrimaryColor
              : MyThemeData.AccentColor,
        ),
        child: Center(
            child: Text(
          source.name,
          style: TextStyle(
              color: selected
                  ? MyThemeData.AccentColor
                  : MyThemeData.PrimaryColor),
        )),
      ),
    );
  }
}
