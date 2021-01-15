import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:personal_toolbox/models/todoList.dart';
import 'package:personal_toolbox/views/styles/textField.dart';

class TodoItem extends StatefulWidget {
  final TodoItemModel item;
  final void Function(TodoItemModel model) addItemCallback;
  final void Function(int id) removeItemCallback;
  const TodoItem({
    Key key,
    this.item,
    this.addItemCallback,
    this.removeItemCallback,
  }) : super(key: key);

  @override
  TodoItemState createState() => TodoItemState();
}

class TodoItemState extends State<TodoItem> {
  bool editEnabled = false;
  TextEditingController textEditController;
  String value;

  @override
  void initState() {
    super.initState();
    this.value = widget.item.title;
    this.textEditController = TextEditingController(text: this.value);
  }

  @override
  void dispose() {
    textEditController.dispose();
    super.dispose();
  }

  TextStyle getTextStyle() {
    if (widget.item.done) {
      return lineThrouhgTextStyle;
    }
    return value.length > 0 ? textFieldTextStyle : textFieldHintStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: Dismissible(
            key: widget.key,
            onDismissed: (direction) {
              widget.removeItemCallback(widget.item.id);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(tr('todoItemRemoved'))));
            },
            background: Container(color: Colors.red),
            child: Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.all(8),
                decoration: textFieldBoxDecoration,
                child: Row(children: <Widget>[
                  Expanded(
                      flex: 7,
                      child: editEnabled && !widget.item.done
                          ? (Center(
                              child: TextField(
                                decoration: new InputDecoration(
                                    hintStyle: textFieldHintStyle,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                    hintText: tr('todoItemPlaceholder')),
                                style: textFieldTextStyle,
                                onSubmitted: (newValue) {
                                  setState(() {
                                    value = newValue;
                                    editEnabled = false;
                                  });
                                  TodoItemModel model = TodoItemModel(
                                      widget.item.id,
                                      newValue,
                                      newValue,
                                      false,
                                      false);
                                  widget.addItemCallback(model);
                                },
                                autofocus: true,
                                controller: textEditController,
                              ),
                            ))
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      editEnabled = true;
                                    });
                                  },
                                  child: Text(
                                      value.length > 0
                                          ? value
                                          : tr('todoItemPlaceholder'),
                                      style: getTextStyle())))),
                  value.length > 0
                      ? IconButton(
                          icon: Icon(
                              widget.item.done ? Icons.close : Icons.check),
                          color: widget.item.done ? Colors.red : Colors.green,
                          onPressed: () {
                            TodoItemModel model = TodoItemModel(
                                widget.item.id,
                                widget.item.title,
                                widget.item.title,
                                !widget.item.done,
                                false);
                            widget.addItemCallback(model);
                          },
                        )
                      : Text('')
                ]))));
  }
}
