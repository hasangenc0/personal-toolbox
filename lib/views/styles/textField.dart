import 'dart:ui';

import 'package:flutter/material.dart';

final textFieldTextStyle = TextStyle(
  fontSize: 18,
  height: 2.0,
  color: Colors.white,
);

final lineThrouhgTextStyle =
    textFieldTextStyle.merge(TextStyle(decoration: TextDecoration.lineThrough));

final textFieldHintStyle =
    textFieldTextStyle.merge(TextStyle(color: Colors.grey));

final textFieldBoxDecoration = BoxDecoration(
    color: Colors.blueGrey, borderRadius: BorderRadius.all(Radius.circular(6)));
