import 'package:flutter/material.dart';
import '../components/Content.dart';
import 'Header.dart';

class NetworkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          DefaultTabController(
            length: 3,
            child: SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: NetworkingPageHeader(
                minExtent: 100.0,
                maxExtent: 200.0,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Content(),
          ),
        ],
      ),
    );
  }
}
