import 'package:caperr/settings.dart';

import 'bokaap.dart';
import 'main.dart';
import 'peninsula.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'simonstown.dart';

class TourenClass extends StatefulWidget {
  const TourenClass({super.key});

  @override
  State<TourenClass> createState() => _TourenClassState();
}

class _TourenClassState extends State<TourenClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3B7BC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/CapeTownRentRide.jpg',
              fit: BoxFit.contain,
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: Text('Cape Town Rent & Ride',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
                child: Icon(
                Icons.map_outlined,
                color: Colors.black,
                size: 24.0,
              ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/sunset - Kopie.JPG'),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                                semanticLabel: 'Bewertung',
                              ),
                              Text('5.0')
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: Text(
                                "Tour: Peninsula Route",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30.0, left: 5),
                            child: Container(
                              child: Text(
                                'Von Hout Bay an der Küste enlang nach Noordhoek',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, left: 5),
                            child: Container(
                              child: Text(
                                'Ab 45€',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PeninsulaClass()),
                    );
                  },
                ),
                const SizedBox(height: 15),
                InkWell(
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/Bo-Kaap2.JPEG'),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                                semanticLabel: 'Bewertung',
                              ),
                              Text('4.9')
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: Container(
                              child: Text(
                                "Tour: Bo-Kaap City Tour",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30.0, left: 5),
                            child: Container(
                              child: Text(
                                'Auf dem Rad durch das lebendige Hippie-Viertel',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, left: 5),
                            child: Container(
                              child: Text(
                                'Ab 30€',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BoKaapClass()),
                    );
                  },
                ),
                const SizedBox(height: 15),
                InkWell(
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/Pinguine2.JPEG'),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                                semanticLabel: 'Bewertung',
                              ),
                              Text('5.0')
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.9, left: 5),
                            child: Container(
                              child: Text(
                                "Tour: Simons Town Tour",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30.0, left: 5),
                            child: Container(
                              child: Text(
                                'In Simons Town am Strand entlang halten wir Ausschau nach den Pinguinen',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, left: 5),
                            child: Container(
                              child: Text(
                                'Ab 60€',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SimonsTownClass()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
