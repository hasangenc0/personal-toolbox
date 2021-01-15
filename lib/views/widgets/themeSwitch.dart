import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Align(
        alignment: Alignment.centerRight,
        child: Transform.scale(
            scale: 1,
            child: Switch(
              onChanged: (bool value) {
                if (AdaptiveTheme.of(context).mode.isLight) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
              value: AdaptiveTheme.of(context).mode.isLight,
              activeColor: Colors.blue,
              activeTrackColor: Colors.redAccent,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.orange,
            )),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          tr('toggleTheme'),
          style: TextStyle(fontSize: 14),
        ),
      ),
    ]);
  }
}
