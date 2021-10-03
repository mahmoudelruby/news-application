import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Categories/CategoriesFragment.dart';
import 'package:news/NewsFragment/HomeFragment.dart';
import 'package:news/NewsFragment/NewsFragment.dart';
import 'package:news/main.dart';
import 'package:news/ui/DrawerWidget.dart';

class NewsApp extends StatefulWidget {
  static String ROUTE_NAME = "home";

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: DrawerWidget(onSideMenuItemClick),
      appBar: AppBar(
        backgroundColor: MyThemeData.PrimaryColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        title: Row(
          children: [Spacer(),
            Text("News App"),
            Spacer(), Icon(Icons.search)],
        ),
      ),

      body: selectedCategory != null
          ? HomeFragment(selectedCategory)
          : CategoriesFragment(onCategoryItemClick),
    );
  }

  String selectedCategory = null;

  void onCategoryItemClick(String categoryId) {
    setState(() {
      selectedCategory = categoryId;
    });
  }

  void onSideMenuItemClick(String sideMenuItem) {
    if (sideMenuItem == 'Categories') {
      setState(() {
        selectedCategory = null;
      });
    } else if (sideMenuItem == 'Settings') {}
    Navigator.pop(context);
  }
}
