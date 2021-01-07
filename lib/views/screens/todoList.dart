import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_toolbox/views/widgets/languageSwitch.dart';
import 'package:personal_toolbox/views/widgets/todoItem.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('todoList')),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ListView(children: <Widget>[
              LanguageSwitch(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Column(children: <Widget>[
                    Expanded(
                        child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: <Widget>[
                        TodoItem(),
                        Text(
                          'Hasan',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          'Hasan',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    )),
                  ])),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.green,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ));
  }
}
