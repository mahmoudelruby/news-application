import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String ImagePath, text;
  Color background;
  bool rightside;
  Function onCategoryItemClick;
  CategoryItem(
      {this.ImagePath,
      this.text,
      this.background,
      this.rightside,
      this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        onCategoryItemClick(text);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * .45,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45),
                topLeft: Radius.circular(45),
                bottomRight: rightside ? Radius.circular(45) : Radius.circular(0),
                bottomLeft:
                    rightside ? Radius.circular(0) : Radius.circular(45))),
        child: Column(
          children: [
            Image.asset(
              "$ImagePath",
              height: 150,
              width: 120,
            ),
            Text(
              "$text",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
