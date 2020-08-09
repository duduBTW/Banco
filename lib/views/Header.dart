import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/Header.dart';
import './HomePage.dart';

class NetworkingPageHeader extends SliverPersistentHeaderDelegate {
  NetworkingPageHeader({
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    List<Widget> headerContent = [
      Header("1.000,00", titleOpacity(shrinkOffset)),
      Center(
          child: Stack(
        children: <Widget>[
          Text("UwU"),
        ],
      )),
      Center(child: Text("UwU")),
    ];
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 24),
          color: Colors.grey[800],
          child: TabBarView(
            children: headerContent,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.grey[800],
              ),
              width: 120,
              height: 10,
              child: TabBar(
                tabs: <Widget>[
                  ...headerContent.map((_) {
                    return Tab(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: CircleTabIndicator(
                            color: Colors.black38, radius: 3),
                      ),
                    );
                  }).toList()
                ],
                indicator: CircleTabIndicator(
                    color: Theme.of(context).primaryColor, radius: 3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 40.0 - (max(0.0, shrinkOffset) / maxExtent) * 13;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
