import 'dart:convert';

import 'package:banco/components/TextRow.dart';
import 'package:flutter/material.dart';

class Sucesso extends StatelessWidget {
  final Animation<double> transitionAnimation;

  const Sucesso({Key key, this.transitionAnimation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AnimatedBuilder(
              animation: transitionAnimation,
              builder: (context, child) {
                return SizeTransition(
                  sizeFactor: transitionAnimation,
                  // scale: ,
                  child: child,
                );
              },
              child: Container(
                // alignment: Alignment(0.0, 0.0),
                width: double.infinity,
                padding: EdgeInsets.only(top: 140, bottom: 100),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Theme.of(context).primaryColor, Color(0xff540000)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  // borderRadius: BorderRadius.circular(5.0),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  "Conta Criada com Sucesso!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Positioned(
              top: 200,
              right: 0.0,
              left: 0.0,
              child: AnimatedBuilder(
                animation: transitionAnimation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(1, 0), end: Offset(0, 0))
                        .animate(CurvedAnimation(
                            curve: Interval(0.5, 1, curve: Curves.easeInOut),
                            parent: transitionAnimation)),
                    child: child,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  // height: 10,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  color: Colors.grey[700],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 0, bottom: 8),
                        child: Text("Dados da sua conta:",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                      ),
                      TextRow(
                        label: "Banco",
                        value: "999",
                      ),
                      TextRow(
                        label: "Agencia",
                        value: "00001",
                      ),
                      TextRow(
                        label: "Conta",
                        value: "1111-2",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
