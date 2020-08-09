import 'package:flutter/material.dart';

import '../views/BalancePage.dart';

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return BalancePage(transitionAnimation: animation);
            },
            transitionDuration: const Duration(milliseconds: 500)));
      },
      child: Container(
        // width: double.infinity,
        height: 130,
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          boxShadow: [
            const BoxShadow(
              color: Colors.black,
            ),
            const BoxShadow(
              color: Colors.black,
              // spreadRadius: -12.0,
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            LineBalanceContent(),
            LineBalanceIndicator(),
          ],
        ),
      ),
    );
  }
}

class LineBalanceIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(color: Colors.green),
            flex: 2,
          ),
          Flexible(
            child: Container(
              color: Colors.red,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class LineBalanceContent extends StatelessWidget {
  final double total;
  final double removido;

  const LineBalanceContent({Key key, this.total, this.removido})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Movimento(value: "1000", type: true),
          const Movimento(value: "500", type: false),
        ],
      ),
    );
  }
}

class Movimento extends StatelessWidget {
  final String value;
  final bool type;

  const Movimento({
    this.type,
    this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            type ? "Adicionado" : "Removido",
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  type ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 30,
                  color: type ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 5, 15),
                child: Text(
                  "R\$:",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
      flex: 1,
    );
  }
}
