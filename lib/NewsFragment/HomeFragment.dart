import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/NewsFragment/HomeTabsFragment.dart';
import 'package:news/modal/SourcesResponce.dart';

class HomeFragment extends StatefulWidget {
  String categoryId;
  HomeFragment(this.categoryId);
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourcesFuture = loadNewsSource();
  }

  Future<SourcesResponce> sourcesFuture;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<SourcesResponce>(
      future: sourcesFuture,
      builder: (buildContext, snapShot) {
        if (snapShot.hasError) {
          return Text('${snapShot.error}');
        } else if (snapShot.hasData) {
          return HomeTabsFragment(snapShot.data.sources);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<SourcesResponce> loadNewsSource() async {
     Uri uri = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
      'apiKey': 'c2d823496a924badb0cf11d1bc38e749',
      'category': widget.categoryId
    });
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      return SourcesResponce.fromJsonMap(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
