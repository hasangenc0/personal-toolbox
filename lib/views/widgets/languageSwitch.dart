import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitch extends StatelessWidget {
  getLocales(BuildContext context) {
    return [
      context.locale,
      ...context.supportedLocales.where(
          (element) => element.languageCode != context.locale.languageCode)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
          isExpanded: true,
          value: context.locale.languageCode,
          elevation: 16,
          onChanged: (String locale) {
            context.locale = Locale(locale);
          },
          items: getLocales(context)
              .map<DropdownMenuItem<String>>((Locale locale) {
            return DropdownMenuItem<String>(
              value: locale.languageCode,
              child: Text(tr(locale.languageCode)),
            );
          }).toList()),
    );
  }
}
