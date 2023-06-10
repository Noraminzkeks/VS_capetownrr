import 'package:caperr/main.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cape Town Rent & Ride',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF3B7BC)),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        useMaterial3: true,
      ),
      home: const LoginClass (title: 'Cape Town Rent & Ride'),
    );
  }
}


class LoginClass extends StatefulWidget {
  const LoginClass({super.key, required this.title});

  final String title;

  @override
  State<LoginClass> createState() => _LoginClassState();
}
  class _LoginClassState extends State<LoginClass> {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar
            (
              backgroundColor: const Color(0xFFF3B7BC),

              title: Row
                (
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                [
                  Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 30,),
                  Container(padding: const EdgeInsets.all(20.0), child: Text('Cape Town Rent & Ride', style: TextStyle(fontFamily: 'Roboto'),))
                ],
              )
          ),
          body:  Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Willkommen zurück!', style: TextStyle(height: 1, fontSize: 25, fontFamily:'Roboto' , fontStyle: FontStyle.italic)),
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
                height: 50,
                width: 250,
                child: OutlinedButton(
                  onPressed: () { },
                  child: Text('Anmelden',style: TextStyle(height: 1, fontSize: 15), ),
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

void main() => runApp(const LoginClass(title: 'Cape Town Rent & Ride'));
