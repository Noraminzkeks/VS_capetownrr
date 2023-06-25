import 'package:caperr/settings.dart';

import 'home.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'buchen.dart';
import 'index.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> list = [
    DropdownMenuItem(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.date_range_outlined,
                color: Colors.black,
                size: 25.0,
                semanticLabel: 'Date',
              ),
              Text('  Datum auswählen '),
            ],
          ),
        ),
        value: "1"),
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('21.07.2023'),
          ],
        ),
        value: "2"),
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('25.07.2023'),
          ],
        ),
        value: "3"),
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('30.07.2023'),
          ],
        ),
        value: "4"),
  ];
  return list;
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: dropdownItems,
    );
  }
}

List<DropdownMenuItem<String>> get dropdownBikes {
  List<DropdownMenuItem<String>> listbike = [
    DropdownMenuItem(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.directions_bike_outlined,
                color: Colors.black,
                size: 25.0,
                semanticLabel: 'Bike',
              ),
              Text('  Anzahl E-Bikes'),
            ],
          ),
        ),
        value: "eins"),
    DropdownMenuItem(child: Text('1 E-Bike '), value: "zwei"),
    DropdownMenuItem(child: Text('2 E-Bikes '), value: "drei"),
    DropdownMenuItem(child: Text('3 E-Bikes '), value: "vier"),
    DropdownMenuItem(child: Text('4 E-Bikes '), value: "fünf"),
  ];
  return listbike;
}

class DropdownButtonBike extends StatefulWidget {
  const DropdownButtonBike({super.key});

  @override
  State<DropdownButtonBike> createState() => _DropdownButtonBikeState();
}

class _DropdownButtonBikeState extends State<DropdownButtonBike> {
  String selectedValue2 = "eins";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue2,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue2 = newValue!;
        });
      },
      items: dropdownBikes,
    );
  }
}

List<DropdownMenuItem<String>> get dropdownKids {
  List<DropdownMenuItem<String>> listKids = [
    DropdownMenuItem(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.pedal_bike,
                color: Colors.black,
                size: 25.0,
                semanticLabel: 'Bike',
              ),
              Text('  Anzahl E-Bikes Kids'),
            ],
          ),
        ),
        value: "eins"),
    DropdownMenuItem(child: Text('1 E-Bike Kid '), value: "zwei"),
    DropdownMenuItem(child: Text('2 E-Bikes Kids '), value: "drei"),
    DropdownMenuItem(child: Text('3 E-Bikes Kids '), value: "vier"),
    DropdownMenuItem(child: Text('4 E-Bikes Kids '), value: "fünf"),
  ];
  return listKids;
}

class DropdownButtonKids extends StatefulWidget {
  const DropdownButtonKids({super.key});

  @override
  State<DropdownButtonKids> createState() => _DropdownButtonKidsState();
}

class _DropdownButtonKidsState extends State<DropdownButtonKids> {
  String selectedValue3 = "eins";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue3,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue3 = newValue!;
        });
      },
      items: dropdownKids,
    );
  }
}

class BuchenPenClass extends StatefulWidget {
  const BuchenPenClass({super.key});

  @override
  State<BuchenPenClass> createState() => _BuchenPenClassState();
}

class _BuchenPenClassState extends State<BuchenPenClass> {
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
                child: Text(
                  'Cape Town Rent & Ride',
                  style: TextStyle(color: Colors.white),
                ))
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('PENINSULA ROUTE',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('3h',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                          fontSize: 15)),
                  Text('Meeting Point: Hout Bay',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                          fontSize: 15)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Vicky.JPEG'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    child: Text('Dein Guide: Vicky',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black87,
                            fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: Divider(color: Colors.black87),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: DropdownButtonExample(),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: DropdownButtonBike(),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: DropdownButtonKids(),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: Text('Die Grundgebühr für diesen Kurs beträgt 45€ pro Person und beinhaltet die geführte Tour sowie die Leihgebühr eines E-Bikes inklusive Helm. Die Tour kann bis zu 48 Stunden vorher kostenfrei storniert werden. Kann die Tour aufgrund von Wetter oder Verkehr nicht stattfinden, werden wir dich telefonisch informieren. Wir freuen uns auf dich!', style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black54,
                  fontSize: 10)),
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    //Pop-Up
                    builder: (context) => AlertDialog(
                        title: Text('Buchung erfolgreich!'),
                        content: Text('Mehr Infos du deiner Buchung erhälst du per Email.'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Index()),
                                );
                              },
                              child: Text('Zurück zum Home-Screen')),
                        ]),
                  );
                },
                child: Text('Buchung abschließen'),
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFFFFFF),
                    backgroundColor: const Color(0xFFF3B7BC)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
