import 'package:caperr/rez.dart';
import 'package:caperr/settings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'index.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  //Eingabefelder, die sog. Controller für die Eingabe durch Nutzer
  final userNameController = TextEditingController();
  final userRezController = TextEditingController();

  //Warten auf Verbindung mit Realtime-Database
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    //Verbindung herstellen zur Datenbank "Rezensionen"
    dbRef = FirebaseDatabase.instance.ref().child('Rezensionen');
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
              child: Text(
                'Cape Town Rent & Ride',
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top:15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text('GIB UNS FEEDBACK',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  //Eingabefeld Nummer 1, Informationen werden im Controller gespeichert
                  controller: userNameController,
                  //Hiermit kann eingestellt werden, über welche Tastatur der Nutzer die Daten eingibt
                  // z.B. bei einer Pin nur Nummern etc.
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  //Eingabefeld Nummer 1, Informationen werden im Controller gespeichert
                  controller: userRezController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Deine Rezension',
                    hintText: 'Deine Rezension',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {
                  //Beim Abschicken der Rezension wird eine Map erstellt:
                  //Map = dynamische Kollektion die beliebig groß/ klein werden kann
                  Map<String, String> Rezensionen = {
                    //Name des Attributs + Inhalt des Controllers
                    'name': userNameController.text,
                    'rez': userRezController.text,
                  };
                  //Einfügen in die Datenbank "Rezensionen"
                  //Datenbank wird falls noch nicht vorhanden automatisch erstellt
                  dbRef.push().set(Rezensionen);
                  showDialog(
                    context: context,
                    //Pop-Up
                    builder: (context) => AlertDialog(
                        title: Text('Vielen Dank!'),
                        content: Text('Wir freuen uns über deine Bewertung!'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FetchData()),
                                );
                              },
                              child: Text('Alle Rezensionen')),
                        ]),
                  );
                },
                child: const Text('Rezension abschicken', style: TextStyle(fontSize: 15)),
                color: const Color(0xFFF3B7BC),
                textColor: Colors.white,
                minWidth: 350,
                height: 60,
              ),
              const SizedBox(
                height: 75,
              ),
              //kleine Bildergalerie
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 103,
                  height: 100,
                  child: Image.asset(
                    'assets/images/nashorn.JPEG',
                    fit: BoxFit.cover,
                  ),
                  ),
                  Container(
                    width: 103,
                    height: 100,
                    child: Image.asset(
                      'assets/images/ship.JPEG',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 103,
                    height: 100,
                    child: Image.asset(
                      'assets/images/tablemountain.JPG',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 103,
                    height: 100,
                    child: Image.asset(
                      'assets/images/botanical.JPEG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
