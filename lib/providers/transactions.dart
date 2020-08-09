import 'package:flutter/cupertino.dart';

class Transactions with ChangeNotifier {
  List<String> _teste = [];

  List<String> get teste {
    return [..._teste];
  }
}
