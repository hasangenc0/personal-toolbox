import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_toolbox/models/todoList.dart';
import 'package:personal_toolbox/services/todoListService.dart';
import 'package:personal_toolbox/views/widgets/languageSwitch.dart';
import 'package:personal_toolbox/views/widgets/todoItem.dart';

class TodoList extends StatefulWidget {
  final service = TodoListService();
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  List<TodoItemModel> items;
  void addItem(TodoItemModel value) {
    widget.service.addItem(value).then((value) => {this.getItems()});
  }

  void updateItem(TodoItemModel value) {
    widget.service.updateItem(value).then((value) => {this.getItems()});
  }

  void getItems() async {
    List<TodoItemModel> _items = await widget.service.getItems();

    if (_items.isNotEmpty) {
      setState(() {
        items = _items;
      });
    }
  }

  void addEmptyItem() {
    if ((items != null &&
        items.isNotEmpty &&
        (items.first.id == null ||
            items.first.title == null ||
            items.first.title == ''))) {
      return;
    }
    setState(() {
      List rest = items != null ? items : [];
      items = [TodoItemModel(null, '', '', false, false), ...rest];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getItems();
  }

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
                      child: items != null && items.length > 0
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: items.length,
                              itemBuilder: (context, i) {
                                return TodoItem(
                                    key: Key(items[i].id.toString()),
                                    value: items[i].title,
                                    addItemCallback: items[i].id != null
                                        ? updateItem
                                        : addItem,
                                    id: items[i].id);
                              },
                            )
                          : Text('empty'),
                    ),
                  ])),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.green,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: addEmptyItem,
                ),
              ),
            ]),
          ),
        ));
  }
}
