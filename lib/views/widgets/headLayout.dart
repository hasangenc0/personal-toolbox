import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_toolbox/views/widgets/themeSwitch.dart';

import 'languageSwitch.dart';

class HeadLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(flex: 1, child: LanguageSwitch()),
          Expanded(flex: 3, child: ThemeSwitch()),
        ]));
  }
}
