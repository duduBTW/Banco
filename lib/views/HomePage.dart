import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Header.dart';
import '../components/Balance.dart';

class HomePage extends StatelessWidget {
  List<Widget> headerContent = [
    // Header("1.000,00"),
    Center(
        child: Stack(
      children: <Widget>[
        Text("UwU"),
      ],
    )),
    Center(child: Text("UwU")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: headerContent.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        // appBar: AppBar(
        //   backgroundColor: Colors.grey[900],
        //   // bottomOpacity: 0.0,
        //   // elevation: 0.0,

        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.person),
        //       onPressed: () {},
        //     )
        //   ],
        //   // title: Text("UwU"),
        // ),
        body: Column(
          children: <Widget>[
            Container(
              height: 110,
              color: Colors.grey[800],
              child: TabBarView(
                children: headerContent,
              ),
            ),
            Container(
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
            // SizedBox(
            //   height: 30,
            // ),
            // ListCategorys(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListCategorys(),
              height: 130,
              width: double.infinity,
            ),
            Container(
              child: ListCards(),
              height: 340,
              width: double.infinity,
            ),
            // Balance(),
          ],
        ),
      ),
    );
  }
}

class ListCategorys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CategoryItem(
          text: "Pagamento",
          icon: Icons.attach_money,
        ),
        CategoryItem(
          text: "Transferência",
          icon: Icons.sync,
        ),
        CategoryItem(
          text: "Extrato",
          icon: Icons.data_usage,
        ),
        CategoryItem(
          text: "Outra",
          icon: Icons.text_rotation_angleup,
        ),
      ],
      scrollDirection: Axis.horizontal,
    );
  }
}

class ListCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Balance(),
          width: 350,
        ),
        Container(
          child: Balance(),
          width: 350,
        ),
        Container(
          child: Balance(),
          width: 350,
        ),
      ],
      // useMagnifier: true,
      // magnification: 1.1,
      // scrollDirection: Axis.vertical,
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const CategoryItem({
    this.text,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // color: Theme.of(context).primaryColor,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: 120,
      child: Stack(
        children: <Widget>[
          Container(
            child: Icon(icon, size: 35, color: Theme.of(context).primaryColor),
            alignment: Alignment(0.0, -0.5),
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            alignment: Alignment(0.0, 0.5),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
