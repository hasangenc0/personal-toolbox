import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: ListView(children: <Widget>[
              Center(
                  child: RichText(
                      text: TextSpan(
                text: 'Hello',
                style: new TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ))),
            ]),
          ),
        ));
  }
}
