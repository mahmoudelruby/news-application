import 'package:flutter/material.dart';
import 'package:news/main.dart';
import 'package:news/modal/articles.dart';

class NewsItem extends StatelessWidget {
  Articles newsItem;
  NewsItem({ this.newsItem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(newsItem.urlToImage,
        height: 200,),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            newsItem.source.name,
            style: TextStyle(color: MyThemeData.labelColor, fontSize: 10),
            textAlign: TextAlign.start,
          ),
        ),
        Text(
          newsItem.title,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Spacer(),
              Text(
                newsItem.publishedAt,
                style: TextStyle(color: MyThemeData.labelColor, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
