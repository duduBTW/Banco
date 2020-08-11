import 'package:banco/components/ListBalance.dart';
import 'package:banco/components/ListItemBalance.dart';
import 'package:banco/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../models/BalanceTransactions.dart';

class BalancePage extends StatelessWidget {
  final Animation<double> transitionAnimation;
  List<BalanceTransactions> _transactions = [
    BalanceTransactions(mes: "Janeiro", dia: [
      Dia(data: "01", transactions: [
        Transaction(
          TranType.adicionar,
          destinatario: Destinatario(nome: "Carlos", conta: "12222"),
          price: 100.00,
        )
      ])
    ]),
    BalanceTransactions(mes: "Fevereiro", dia: [
      Dia(data: "04", transactions: [
        Transaction(
          TranType.adicionar,
          destinatario: Destinatario(nome: "Carlos", conta: "12222"),
          price: 300.20,
        ),
        Transaction(
          TranType.adicionar,
          destinatario: Destinatario(nome: "idk", conta: "12222"),
          price: 10.15,
        ),
      ]),
      Dia(data: "05", transactions: [
        Transaction(
          TranType.adicionar,
          destinatario: Destinatario(nome: "uwu", conta: "3333"),
          price: 31.20,
        ),
        Transaction(
          TranType.adicionar,
          destinatario: Destinatario(nome: "owo", conta: "4444"),
          price: 300.20,
        ),
        Transaction(
          TranType.adicionar,
          destinatario: Destinatario(nome: "pog", conta: "5555"),
          price: 300.20,
        ),
      ])
    ])
  ];

  BalancePage({Key key, this.transitionAnimation}) : super(key: key);
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Saldo em conta",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "R\$: 1.000,00",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              // Divider(
              //   color: Colors.grey[400],
              // ),
              SizedBox(
                height: 25,
              ),
              Divider(
                height: 1,
                color: Colors.grey[400],
              ),
              specialCharsPanel(),
              Divider(
                height: 1,
                color: Colors.grey[400],
              ),
              Container(
                height: 393,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return StickyHeader(
                        header: Container(
                          height: 50.0,
                          color: Colors.grey[800],
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _transactions[index].mes,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        content: Column(
                          children: <Widget>[
                            ..._transactions[index]
                                .dia
                                .map((transaction) => ListBalance(
                                      transaction: transaction,
                                    ))
                                .toList(),
                          ],
                        ));
                  },
                  itemCount: _transactions.length,
                ),
                // width: ,
                // child: ListView(
                //   children: <Widget>[
                //     StickyHeader(
                //       header: Container(
                //         height: 50.0,
                //         color: Colors.grey[800],
                //         padding: EdgeInsets.symmetric(horizontal: 16.0),
                //         alignment: Alignment.centerLeft,
                //         child: Text(
                //           'Fevereiro 2020',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       content: Column(
                //         children: <Widget>[
                //           ListBalance(),
                //         ],
                //       ),
                //     ),
                //     StickyHeader(
                //       header: Container(
                //         height: 50.0,
                //         color: Colors.grey[800],
                //         padding: EdgeInsets.symmetric(horizontal: 16.0),
                //         alignment: Alignment.centerLeft,
                //         child: Text(
                //           'Janeiro 2020',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       content: ListBalance(),
                //     ),
                //     StickyHeader(
                //       header: Container(
                //         height: 50.0,
                //         color: Colors.grey[800],
                //         padding: EdgeInsets.symmetric(horizontal: 16.0),
                //         alignment: Alignment.centerLeft,
                //         child: Text(
                //           'Dezembro 2019',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       content: Column(
                //         children: <Widget>[
                //           ListBalance(),
                //           ListBalance(),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
              ),
            ],
          ),
        ));
  }
}

Widget specialCharsPanel() {
  return Container(
    color: Colors.grey[800],
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
