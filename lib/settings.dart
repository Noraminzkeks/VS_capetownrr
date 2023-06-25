import 'package:caperr/givRez.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'index.dart';

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
      home: const Settings (),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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

      // Aufbau und Styling der Einstellungen
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //
            Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //Überschrift
                        Icon(Icons.info_outline, color: Color(0xFFF3B7BC)),

                        Text(' Mehr Informationen und Support',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Hilfe
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.question_mark,
                          color: Color(0xfff3b7bc),
                        ),
                        Text('  Hilfe'),

                        Spacer(),

                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color(0xfff3b7bc)),
                          ),

                          onPressed: (){
                            showDialog(context: context, builder: (context) => AlertDialog(
                                title: Text('Hilfe'),
                                content: Text('Hier kannst du grundlegende Einstellungen ändern!'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),]
                            ),
                            );
                          },
                          child: Text('Hilfe'),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Über
                    Row(
                      children: <Widget>[

                        Icon(
                          Icons.info_outline,
                          color: Color(0xfff3b7bc),
                        ),
                        Text('  Über'),

                        Spacer(),

                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color(0xfff3b7bc)),
                          ),

                          onPressed: (){
                            showDialog(context: context, builder: (context) => AlertDialog(
                                title: Text('Über'),
                                content: Text(
                                    'Anbieter:\nCape Town Rent & Ride\nRondebosch, Cape Town,\n7700, South Africa\n\nKontakt:\nTelefon: +27 123 45678\nEmail: info@capetownrr.za\n\nVerantwortliche:\nVictoria Lahr und Nora Kuzminskas'
                                ),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),]
                            ),
                            );
                          },
                          child: Text('Über'),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Icon(Icons.favorite, color: Color(0xfff3b7bc)),

                    Text('Gib uns Feedback!',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color(0xfff3b7bc)),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InsertData()),
                        );
                      },
                      child: Text('Rezension schreiben'),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}