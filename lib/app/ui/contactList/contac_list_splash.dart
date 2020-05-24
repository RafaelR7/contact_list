import 'package:contact_list/app/i18n/i18n.dart';
import 'package:contact_list/app/styles/styles.dart';
import 'package:contact_list/app/ui/contactList/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class ContactListSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: ContactList(),
      title: Text(
        "${I18n.of(context).contactList}",
        style: Styles.splashScreenText,
      ),
      image: Image.asset('assets/images/contact.png'),
      gradientBackground: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 60.0,
      loaderColor: Colors.transparent,
    );
  }
}
