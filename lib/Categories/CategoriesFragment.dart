import 'package:flutter/material.dart';
import 'package:news/Categories/CategoryItem.dart';
import 'package:news/main.dart';

class CategoriesFragment extends StatelessWidget {
  Function onCategoryItemCallBack;
  static const String business = 'business';
  static const String entertainment = 'entertainment';
  static const String general = 'general';
  static const String health = 'health';
  static const String science = 'science';
  static const String sports = 'sports';
  static const String technology = 'technology';
  CategoriesFragment(this.onCategoryItemCallBack);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Pick your category of interest",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(
                ImagePath: 'assets/images/sports.png',
                text: sports,
                background: MyThemeData.red,
                rightside: false,
                onCategoryItemClick: onCategoryItemCallBack,
              ),
              CategoryItem(
                  ImagePath: 'assets/images/Politics.png',
                  text: general,
                  background: MyThemeData.blue,
                  rightside: true,
                  onCategoryItemClick: onCategoryItemCallBack),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(
                  ImagePath: 'assets/images/health.png',
                  text: health,
                  background: MyThemeData.pink,
                  rightside: false,
                  onCategoryItemClick: onCategoryItemCallBack),
              CategoryItem(
                  ImagePath: 'assets/images/bussines.png',
                  text: business,
                  background: MyThemeData.whitebrown,
                  rightside: true,
                  onCategoryItemClick: onCategoryItemCallBack),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(
                  ImagePath: 'assets/images/environment.png',
                  text: entertainment,
                  background: MyThemeData.whiteblue,
                  rightside: false,
                  onCategoryItemClick: onCategoryItemCallBack),
              CategoryItem(
                  ImagePath: 'assets/images/science.png',
                  text: science,
                  background: MyThemeData.yellow,
                  rightside: true,
                  onCategoryItemClick: onCategoryItemCallBack),
            ],
          )
        ],
      ),
    );
  }
}
