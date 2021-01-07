import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() callback;
  Box(this.text, this.color, this.callback);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.color,
      borderRadius: BorderRadius.all(Radius.circular(6)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: callback,
        child: Center(
          heightFactor: 3,
          child: Text(
            this.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
