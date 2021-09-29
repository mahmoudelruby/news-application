import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/NewsFragment/NewsItem.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/modal/SourcesResponce.dart';
import 'package:news/modal/source.dart';
import 'package:http/http.dart' as http;

class NewsFragment extends StatefulWidget {
  Source sources;
  NewsFragment(this.sources);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  ScrollController controller;
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    newsApiFuture = loadNews(page: page);
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.position.pixels == 0) {
        } else {
          newsApiFuture.then((NewsResponse) {
            loadNews(page: page++).then((NewsResponse2) {
              if (NewsResponse2.articles != null) {
                setState(() {
                  NewsResponse.articles.addAll(NewsResponse2.articles);
                });
              }
            });
          });
        }
      }
    });
  }

  Future<NewsResponse> newsApiFuture;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<NewsResponse>(
        future: newsApiFuture,
        builder: (buildContext, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
                controller: controller,
                itemBuilder: (buildContext, index) {
                  return NewsItem(newsItem: snapShot.data.articles[index]);
                },
                itemCount: snapShot.data.articles.length);
          } else if (snapShot.hasError) {
            return Text('{$snapShot.error}');
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<NewsResponse> loadNews({int page = 1}) async {
    final uri = Uri.https('newsapi.org', '/v2/everything', {
      'apiKey': 'c2d823496a924badb0cf11d1bc38e749',
      'sources': widget.sources.id,
      'page': '$page'
    });
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200)
      return NewsResponse.fromJsonMap(jsonDecode(response.body));
    else
      throw Exception(response.body);
  }
}
