import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:personal_toolbox/views/screens/home.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('tr')],
      path: 'assets/i18n', // <-- change patch to your
      fallbackLocale: Locale('en'),
      child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Toolbox App',
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Home(),
    );
  }
}
