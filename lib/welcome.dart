import 'package:caperr/main.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class WelcomeClass extends StatefulWidget {
  const WelcomeClass({super.key});

  @override
  State<WelcomeClass> createState() => _WelcomeClassState();
}
class _WelcomeClassState extends State<WelcomeClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
          backgroundColor: const Color(0xFFF3B7BC),

          title: Row
            (
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Image.asset(
                'assets/images/CapeTownRentRide.jpg', fit: BoxFit.contain,
                height: 30,),
              Container(padding: const EdgeInsets.all(20.0),
                  child: Text('Cape Town Rent & Ride', style: TextStyle(
                      fontFamily: 'Roboto', color: Colors.black),))
            ],
          )
      ),
      body: Center(
      child: SizedBox(
          height: 50,
          width: 250,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => Index())
              );
            },
            child: Text('Anmelden',style: TextStyle(height: 1, fontSize: 15), ),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFFFFFFF),
              backgroundColor: const Color(0xFFF3B7BC),
              side: BorderSide(color: const Color(0xFFFFFFFF)),
          ),
      ),
    ),
      ),
    );
  }
}