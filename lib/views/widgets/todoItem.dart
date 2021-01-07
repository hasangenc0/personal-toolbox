import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: Dismissible(
          key: Key('2'),
          onDismissed: (direction) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("dismissed")));
          },
          background: Container(color: Colors.red),
          child: ListTile(title: Text('iiii')),
        ));
  }
}
