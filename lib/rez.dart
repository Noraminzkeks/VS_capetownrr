import 'package:caperr/home.dart';
import 'package:caperr/settings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'index.dart';


class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  //Herstellen der Datenbank-Verbindung mit DB "Rezensionen"
  DatabaseReference dbref = FirebaseDatabase.instance.ref("Rezensionen");

  //Hier werden die abgerufenen und in der Map "rez" Daten gestylt
  Widget listItem({required Map rez}){
      return Container(
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF3B7BC))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  color: const Color(0xFFF3B7BC),
                  size: 25.0,
                  semanticLabel: 'Person',
                ),
                const SizedBox(
                  width: 15,
                ),
            Text(
              rez['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.message,
              color: const Color(0xFFF3B7BC),
              size: 25.0,
              semanticLabel: 'Nachricht',
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
            child: Text(
              rez['rez'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            ),
          ],
        ),
      ],
        ),
      );
    }

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
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Index()),
                );
              },
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          //Von Firebase vorgegebener Datentyp zur Erstellung von Listen aus der Realtime-Database
          child: FirebaseAnimatedList(
            //Query liegt bereits auf "Rezensionen" und wir wollen die ganze DB
            query: dbref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              //Es wird ein "Snapshot" von der DB erstellt und in der Kollektion "rez" gespeichert
              Map rez = snapshot.value as Map;
              rez['key'] = snapshot.key;
              //"rez" wird nun als Parameter für das Widget listItem verwendet
              //Ergebnis ist die FirebaseAnimated List mit allen Daten aus "Rezensionen"
              //Die einzelnen Elemente wurden mit dem Widget listItem gestylt
              return listItem(rez:rez);
            },
          ),
    ),
    );
  }
}



