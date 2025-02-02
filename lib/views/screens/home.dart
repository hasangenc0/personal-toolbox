import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_toolbox/views/screens/todoList.dart';
import 'package:personal_toolbox/views/styles/toolBox.dart';
import 'package:personal_toolbox/views/widgets/box.dart';
import 'package:personal_toolbox/views/widgets/headLayout.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('home')),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: ListView(children: <Widget>[
              HeadLayout(),
              Center(
                  child: RichText(
                      text: TextSpan(
                text: tr('tools'),
                style: new TextStyle(
                  fontSize: 18,
                  color: getToolboxTitleColor(context),
                ),
              ))),
              Box(
                  tr('todoList'),
                  getToolboxColor(context),
                  () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => TodoList()),
                            ModalRoute.withName('/'))
                      })
            ]),
          ),
        ));
  }
}
