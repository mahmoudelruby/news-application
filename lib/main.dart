import 'package:flutter/material.dart';
import 'package:news/NewsFragment/NewsFragment.dart';
import 'package:news/ui/NewsApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: MyThemeData.PrimaryColor,
          accentColor: MyThemeData.AccentColor),
      routes: {
        NewsApp.ROUTE_NAME: (buildContext) => NewsApp(),

      },
      initialRoute: NewsApp.ROUTE_NAME,
    );
  }
}

class MyThemeData {
  static var PrimaryColor = Color.fromARGB(255, 57, 165, 82);
  static var AccentColor = Color.fromARGB(255, 255, 255, 255);
  static var red = Color.fromARGB(255, 201, 28, 34);
  static var blue = Color.fromARGB(255, 0, 62, 144);
  static var pink = Color.fromARGB(255, 237, 30, 121);
  static var whitebrown = Color.fromARGB(255, 207, 126, 72);
  static var whiteblue = Color.fromARGB(255, 72, 130, 207);
  static var yellow = Color.fromARGB(255, 242, 211, 82);
  static var labelColor = Color.fromARGB(255, 121, 130, 139);

}
