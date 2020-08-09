import 'package:flutter/material.dart';
import '../components/Balance.dart';

class BalancePage extends StatelessWidget {
  final Animation<double> transitionAnimation;

  const BalancePage({Key key, this.transitionAnimation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          // bottomOpacity: 0.0,
          // elevation: 0.0,
          title: Text("Extrato"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            )
          ],
          // title: Text("UwU"),
        ),
        body: Column(
          children: <Widget>[
            LineBalanceContent(),
            LineBalanceIndicator(),
            specialCharsPanel()
          ],
        ));
  }
}

Widget specialCharsPanel() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(0),
    margin: EdgeInsets.all(0),
    // elevation: 4.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          child: Text(
            "30 dias",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {},
        ),
        FlatButton(
          child: Text(
            "30 dias",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {},
        ),
        FlatButton(
          child: Text(
            "10 dias",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
