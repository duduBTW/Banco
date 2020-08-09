import 'package:banco/components/TextRow.dart';
import 'package:flutter/material.dart';
import '../../models/User.dart';

class Confirmar extends StatelessWidget {
  final User user;
  final Function close;
  final Function finalizar;

  const Confirmar({Key key, @required this.user, this.close, this.finalizar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 35),
            child: Text(
              "Confirmar Dados",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          TextRow(label: "Nome", value: user.nome),
          TextRow(label: "Email", value: user.email),
          TextRow(label: "Senha", value: user.senha),
          Spacer(
            flex: 2,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  alignment: Alignment(1.0, 0.0),
                  child: FlatButton.icon(
                      textColor: Colors.white,
                      icon: Icon(Icons.navigate_before),
                      label: Text("Voltar"),
                      onPressed: close),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  alignment: Alignment(1.0, 0.0),
                  child: FlatButton.icon(
                    textColor: Colors.white,
                    icon: Icon(Icons.navigate_next),
                    label: Text("Finalizar"),
                    onPressed: finalizar,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
