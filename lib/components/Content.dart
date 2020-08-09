import 'package:flutter/material.dart';
import '../views/HomePage.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          child: ListCategorys(),
          height: 120,
          width: double.infinity,
        ),
        ListCards(),
      ],
    );
  }
}
