import 'package:flutter/material.dart';
import './ListItemBalance.dart';

import '../models/BalanceTransactions.dart';

class ListBalance extends StatelessWidget {
  final Dia transaction;

  const ListBalance({Key key, @required this.transaction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "sex",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    transaction.data,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "jan",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              alignment: Alignment(0.0, 0.0),
              padding: EdgeInsets.only(top: 20),
            ),
            flex: 2),
        Expanded(
          flex: 9,
          child: Column(
            children: <Widget>[
              ...transaction.transactions
                  .map((e) => ListItemBalance(
                        transaction: e,
                      ))
                  .toList(),
              Divider(
                height: 1,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
