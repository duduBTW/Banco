import 'package:banco/views/registro/Sucesso.dart';
import 'package:banco/views/registro/dados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/Login.dart';
import './views/HomePage.dart';
import 'views/Home.dart';
import './providers/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  bool logedIn = false;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _logIn(String conta) {
    setState(() {
      widget.logedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.red,
          primaryColor: Color(0xffba0000),
          backgroundColor: Colors.grey[900]),
      // initialRoute: widget.logedIn ? '/home' : '/login',
      home: widget.logedIn ? NetworkingPage() : Login(widget.logedIn, _logIn),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => Login(widget.logedIn, _logIn),
        '/home': (context) => NetworkingPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/register': (context) => Register(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/register") {
          return PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation =
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut);

                return SlideTransition(
                    child: child,
                    position:
                        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(animation));
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return Register();
              },
              transitionDuration: const Duration(milliseconds: 400));
        }

        if (settings.name == "/sucesso") {
          return PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation =
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut);

                return SlideTransition(
                    child: child,
                    position:
                        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(animation));
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return Sucesso(transitionAnimation: animation);
              },
              transitionDuration: const Duration(milliseconds: 500));
        }

        // unknown route
        // return MaterialPageRoute(builder: (context) => UnknownPage());
      },
    );
  }
}
