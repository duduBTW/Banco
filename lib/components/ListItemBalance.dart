import 'package:flutter/material.dart';
import '../models/BalanceTransactions.dart';

class ListItemBalance extends StatelessWidget {
  final Transaction transaction;

  const ListItemBalance({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: ListTile(
        leading: Container(
          width: 20,
          child: Icon(
            transaction.tipoTransaferencia == TranType.adicionar
                ? Icons.add
                : Icons.remove,
            color: transaction.tipoTransaferencia == TranType.adicionar
                ? Colors.green[800]
                : Colors.red,
          ),
          alignment: Alignment(0.0, 0.0),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "R\$${transaction.price}",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        subtitle: Text(
          "${transaction.destinatario.conta} - ${transaction.destinatario.nome}",
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: FlatButton(
          child: Text(""),
          onPressed: () => {},
        ),
        // isThreeLine: true,
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }
}
