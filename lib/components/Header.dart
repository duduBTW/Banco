import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String _textContent;
  final double _fontSize;

  Header(this._textContent, this._fontSize);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _visible = true;

  void toggleVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // margin: EdgeInsets.only(
      //   left: 40,
      //   right: 40,
      //   top: 10,
      // ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 5, 15),
            child: Text(
              "R\$:",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          if (_visible)
            Text(
              widget._textContent,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: widget._fontSize,
                  fontWeight: FontWeight.w600),
            ),
          if (!_visible)
            Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[400]],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
            ),
          IconButton(
            icon: Icon(
              Icons.remove_red_eye,
            ),
            splashColor: Colors.white,
            color: Colors.white,
            onPressed: toggleVisible,
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
