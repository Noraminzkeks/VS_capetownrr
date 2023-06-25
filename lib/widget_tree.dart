import 'home.dart';
import 'auth.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    //Erstellt eine Live-Verbindung zur Firebase-Authentification
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //wenn Daten übergeben werden und diese richtig sind, dann wird weitergeleitet auf die Home_Seite
          return HomeClass();
        } else {
          //sonst bleibt man auf der Login-Seite
          return const LoginClass();
        }
      },
    );
  }
}
