import 'package:banco/components/InputFormMultStep.dart';
import 'package:banco/providers/transactions.dart';
import 'package:banco/views/registro/Confirmar.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../models/User.dart';

class Register extends StatefulWidget {
  // Widget _widgetAtual = Name();
  int _widgetAtual = 0;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _form = GlobalKey<FormState>();
  final _registerFocusNode = FocusNode();
  var _user = User();
  bool _shoudAnimateOut = true;

  void setNome(String value) {
    setState(() {
      _user.nome = value;
    });

    changePage();
  }

  void setEmail(String value) {
    setState(() {
      _user.email = value;
    });

    changePage();
  }

  void setSenha(String value) {
    setState(() {
      _user.senha = value;
    });

    showModal();
  }

  void showModal() {
    showBarModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context, scrollController) => Confirmar(
        user: _user,
        close: () {
          Navigator.of(context).pop();
        },
        finalizar: () {
          Navigator.of(context).pop();
          Navigator.of(context).popAndPushNamed("/sucesso");
        },
      ),
    );
  }

  void changePage() {
    setState(() {
      widget._widgetAtual++;
    });
  }

  void backPage() {
    setState(() {
      widget._widgetAtual--;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = [
      Dismissible(
        key: new ValueKey(55),
        resizeDuration: null,
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) {
          changePage();
        },
        child: InputFormMultStep(
          setValue: setNome,
          value: _user.nome,
          label: "Nome",
          key: ValueKey(1),
        ),
      ),
      Dismissible(
        key: new ValueKey(56),
        resizeDuration: null,
        onDismissed: (DismissDirection direction) {
          {
            setState(() {
              _shoudAnimateOut = false;
            });

            if (direction == DismissDirection.endToStart) {
              changePage();
            }
            if (direction == DismissDirection.startToEnd) {
              backPage();
            }
          }
        },
        child: InputFormMultStep(
          setValue: setEmail,
          value: _user.email,
          label: "Email",
          key: ValueKey(2),
        ),
      ),
      // Name(setNome: setNome, nome: _user.nome),
      // Email(),
      Dismissible(
        key: new ValueKey(55),
        resizeDuration: null,
        direction: DismissDirection.startToEnd,
        onDismissed: (DismissDirection direction) {
          backPage();
        },
        child: InputFormMultStep(
          setValue: setSenha,
          value: _user.senha,
          // hiddenDef: true,
          label: "Senha",
          key: ValueKey(3),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          child: Form(
        key: _form,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              height: 20,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black12, width: 1.0),
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  AnimatedContainer(
                    curve: Curves.easeInOut,
                    width: MediaQuery.of(context).size.width *
                        (widget._widgetAtual / _widgetList.length),
                    duration: Duration(milliseconds: 700),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _widgetList[widget._widgetAtual],
                // switchInCurve: Threshold(10.0),
                reverseDuration: Duration(milliseconds: 10),
                transitionBuilder: (child, animation) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.easeInOut);
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(-1.0, 0.5), end: Offset.zero)
                        .animate(animation),
                    child: child,
                  );
                }),
            Spacer(
              flex: 3,
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
                        onPressed: widget._widgetAtual == 0 ? null : backPage),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment(1.0, 0.0),
                    child: FlatButton.icon(
                      textColor: Colors.white,
                      icon: Icon(Icons.navigate_next),
                      label: Text("Continuar"),
                      onPressed: widget._widgetAtual == _widgetList.length - 1
                          ? showModal
                          : changePage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
