import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String label;
  final String value;

  const TextRow({Key key, @required this.label, @required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            flex: 2,
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20),
          //     child: IconButton(
          //       icon: Icon(
          //         Icons.remove_red_eye,
          //         color: Colors.white,
          //         size: 20,
          //       ),
          //       onPressed: () {},
          //     ),
          //   ),
          //   flex: 1,
          // )
        ],
      ),
    );
  }
}
