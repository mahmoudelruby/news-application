import 'package:flutter/material.dart';
import 'package:news/NewsFragment/TabItem.dart';
import 'package:news/modal/source.dart';
import 'package:news/ui/NewsApp.dart';

import 'NewsFragment.dart';

class HomeTabsFragment extends StatefulWidget {
  List<Source> sources;
  HomeTabsFragment(this.sources);

  @override
  _HomeTabsFragmentState createState() => _HomeTabsFragmentState();
}

class _HomeTabsFragmentState extends State<HomeTabsFragment> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                isScrollable: true,
                tabs: widget.sources
                    .map((sourceItem) => TabItem(
                        selectedIndex == widget.sources.indexOf(sourceItem),
                        sourceItem))
                    .toList()),
            Expanded(
                child: TabBarView(
              children: widget.sources
                  .map((sourceItem) => NewsFragment(sourceItem))
                  .toList(),
            ))
          ])),
    );
  }
}
