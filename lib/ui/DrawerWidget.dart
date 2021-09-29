import 'package:flutter/material.dart';
import 'package:news/main.dart';

class DrawerWidget extends StatelessWidget{
  Function onSideMenuItemCallBack;
  DrawerWidget(this.onSideMenuItemCallBack);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Container(
  color: MyThemeData.AccentColor,
  width: MediaQuery.of(context).size.width*.60,
  height: double.infinity,
  child: (
      Column(
        children: [
          Container(
            height:MediaQuery .of(context).size.height*0.25 ,
            color: MyThemeData.PrimaryColor
            ,child: DrawerHeader(
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text('news app',style: TextStyle(fontSize: 22,
                    color: MyThemeData.AccentColor),),
              ),
            ),
          ),

          ),
          TextButton(
              onPressed: (){
                onSideMenuItemCallBack('Categories');
              },
              child: Row(
            children: [
              Icon(Icons.list,color: Colors.black ,),
              SizedBox(width: 8,),
              Text('Categories',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),)
            ],

          )),
          TextButton(
              onPressed: (){
                onSideMenuItemCallBack('Settings');
              },
              child: Row(
                children: [
                  Icon(Icons.settings,color: Colors.black ,),
                  SizedBox(width: 8,),
                  Text('Settings',
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),)
                ],

              ))

        ],
      )
  ),
);  }

}