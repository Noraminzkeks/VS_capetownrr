import 'dart:async';
import 'package:caperr/welcome.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

// 3 Sekunden Ladezeichen bevor Routing zur "Welcome" Seite
class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Welcome()));
    },
    );
  }

  //Styling Ladebildschirm
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1500,
        width: 900,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF3B7BC),
              Colors.white
              // Background Color Gradient
            ],
          ),
        ),

        // Sich drehender Kreis -> Ladesymbol
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}