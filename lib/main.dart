import 'package:contact_list/app/i18n/i18n_delegate.dart';
import 'package:contact_list/app/styles/styles.dart';
import 'package:contact_list/app/ui/contactList/contac_list_splash.dart';
import 'package:contact_list/app/ui/contactList/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.customTheme,
      home: ContactListSplash(),
      routes: <String, WidgetBuilder>{
        '/contactList': (BuildContext context) => ContactList(),
      },
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pt', ''),
      ],
    );
  }
}
