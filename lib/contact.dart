import 'package:caperr/main.dart';
import 'package:flutter/material.dart';


class ContactClass extends StatefulWidget {
  const ContactClass ({super.key});

  @override
  State<ContactClass> createState() => _ContactClassState();
}
class _ContactClassState extends State<ContactClass> {
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
      body: SingleChildScrollView(
      ),
    );
  }
}