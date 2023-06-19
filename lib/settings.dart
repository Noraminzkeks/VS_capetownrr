import 'package:caperr/welcome.dart';
import 'package:flutter/material.dart';

import 'loading.dart';


const List<String> list = <String>['Deutsch', 'Englisch', 'Afrikans'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      elevation: 16,
      style: const TextStyle(color: Color(0xfff3b7bc)),
      underline: Container(
        height: 2,
        color: Color(0xfff3b7bc),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

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
        title: Text('Cape Town Rent & Ride',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        leading: Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 30),
      ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Card(
                child: Padding(
                padding: EdgeInsets.all(20.0),
                 child: Column(
                   children: <Widget>[

                   Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       //Überschrift
                       Icon(Icons.manage_accounts_outlined, color: Color(0xFFF3B7BC)),

                       Text('Account',
                         style: TextStyle(
                           fontSize: 20,
                         ),
                       ),
                      ],
                   ),

                  //Sprachauswahl
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        color: Color(0xfff3b7bc),
                      ),
                      Text('  Sprache auswählen:'),
                      Spacer(),
                      DropdownButtonExample(),
                    ],
                  ),

                     //Passwort ändern
                     Row(
                       children: <Widget>[

                         Icon(
                           Icons.key,
                           color: Color(0xfff3b7bc),
                         ),
                         Text('  Passwort ändern:'),

                         Spacer(),

                         ElevatedButton(

                           style: const ButtonStyle(
                             backgroundColor: MaterialStatePropertyAll(Color(0xfff3b7bc)
                             ),
                           ),

                           onPressed: (){
                             showDialog(
                               context: context,
                               builder: (BuildContext context) => AlertDialog(
                                 title: const Text('Passwort ändern'),
                                 content: const TextField(
                                   obscureText: true,
                                   decoration: InputDecoration(
                                     border: OutlineInputBorder(),
                                     labelText: 'Neues Passwort',
                                   ),
                                 ),

                                 actions: <Widget>[
                                   TextButton(
                                     onPressed: () => Navigator.pop(context, 'Abbrechen'),
                                     child: const Text('Abbrechen'),
                                   ),
                                   TextButton(
                                     onPressed: () => Navigator.pop(context, 'OK'),
                                     child: const Text('OK'),
                                   ),
                                 ],
                               ),
                             );
                           },
                           child: Text('Passwort ändern'),
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
                  child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          //Überschrift
                          Icon(Icons.info_outline, color: Color(0xFFF3B7BC)),

                          Text('Mehr Informationen und Support',
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

                    Text('Empfehle uns weiter!',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(
                      width: 25,
                    ),

                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color(0xfff3b7bc)),
                      ),

                      onPressed: (){},
                      child: Text('Weiterempfehlen'),
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