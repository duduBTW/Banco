import 'package:banco/views/registro/dados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String conta;

  User(this.conta);
}

class Login extends StatefulWidget {
  final bool _isLogedIn;
  final Function _logedIn;
  String _conta = "";

  Login(this._isLogedIn, this._logedIn);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var _user = User("");

    void _setConta(String value) {
      _form.currentState.reset();
      setState(() {
        widget._conta = value;
      });

      // Navigator.of(context).pushNamed('/home');
    }

    void _login() {
      _form.currentState.save();

      widget._logedIn(_user.conta);
      // Navigator.of(context).pushNamed('/home');
    }

    return Scaffold(
        body: Container(
      color: Colors.grey[850],
      height: deviceSize.height,
      width: deviceSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Banco",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedSize(
            curve: Curves.fastOutSlowIn,
            vsync: this,
            alignment: Alignment(0.0, 1.0),
            duration: Duration(milliseconds: 300),
            child: Container(
              height: widget._conta.isEmpty ? 200 : 275,
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget._conta.isEmpty)
                      TextFormField(
                        key: ValueKey(1),
                        decoration: InputDecoration(
                            labelText: 'Conta',
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Color(0xffba0000))),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: _setConta,
                        // onSaved: (value) {
                        //   _user = User(value);
                        // },
                      ),
                    if (widget._conta.isNotEmpty)
                      ListTile(
                        leading: Image.network(
                            "https://i.pinimg.com/originals/2d/e9/c6/2de9c607a36a95573d7a9a862a42ab27.png"),
                        title: Text("Nome"),
                        subtitle: Text(widget._conta),
                        trailing: FlatButton(
                          child: Text("Trocar"),
                          onPressed: () => _setConta(""),
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                    if (widget._conta.isNotEmpty) SizedBox(height: 20),
                    if (widget._conta.isNotEmpty)
                      TextFormField(
                        key: ValueKey(2),
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Color(0xffba0000))),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) => _login(),
                        onSaved: (value) {
                          _user = User(value);
                        },
                      ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: FlatButton(
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xffba0000), Color(0xfff75454)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 250.0, minHeight: 45.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Entrar",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () => _form.currentState.save(),
                      ),
                    )
                  ],
                ),
              ),
              // alignment: Alignment(0.0, 0.0),
              // width: 300,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[500]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: FlatButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
              child: Text(
                "Abrir uma Conta",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
