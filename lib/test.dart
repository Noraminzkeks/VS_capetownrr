import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'map.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}
class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF3B7BC),
          title: Text('Cape Town Rent & Ride',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
          leading: Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 30),

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
              },
            ),
          ],
        ),

          body: Container(
            height: 400,
            child: Column(
                children: [

            ],
            ),
          ),
      ),
    );
  }
}