import 'package:caperr/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterClass extends StatefulWidget {
  const RegisterClass({super.key});

  @override
  State<RegisterClass> createState() => _RegisterClassState();
}
class _RegisterClassState extends State<RegisterClass> {
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
                Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 30,),
                Container(padding: const EdgeInsets.all(20.0), child: Text('Cape Town Rent & Ride', style: TextStyle(fontFamily: 'Roboto', color: Colors.black)))
              ],
            )
        ),
        body:  Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Herzlich Willkommen!', style: TextStyle(height: 1, fontSize: 25, fontFamily:'Roboto' , fontStyle: FontStyle.italic)),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 250,
                    child: Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 70,),
                      ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Benutzername',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Passwort',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Passwort wiederholen',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 50,
                      width: 250,
                      child: OutlinedButton(
                        onPressed: () { },
                        child: Text('Registrieren',style: TextStyle(height: 1, fontSize: 15), ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFFFFFFF),
                          backgroundColor: const Color(0xFFF3B7BC),
                          side: BorderSide(color: const Color(0xFFFFFFFF)),
                        ),
                      )
                  ),
                ]
            )
        ),
        ),
    );
  }
}


