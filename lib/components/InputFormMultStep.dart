import 'package:flutter/material.dart';

class InputFormMultStep extends StatefulWidget {
  final Function setValue;
  final String value;
  final String label;

  const InputFormMultStep(
      {Key key,
      @required this.setValue,
      @required this.value,
      @required this.label})
      : super(key: key);

  @override
  _InputFormMultStepState createState() => _InputFormMultStepState();
}

class _InputFormMultStepState extends State<InputFormMultStep> {
  bool hidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                // height: 100,
                // width: 100,
                child: TextFormField(
                  obscureText: hidden,
                  initialValue: widget.value,
                  onFieldSubmitted: (value) => widget.setValue(value),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      border: InputBorder.none,
                      labelText: widget.label,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  // onSaved: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      hidden = !hidden;
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
