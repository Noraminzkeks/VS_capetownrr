import 'package:caperr/main.dart';
import 'package:caperr/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'map.dart';

class ContactClass extends StatefulWidget {
  const ContactClass({super.key});

  @override
  State<ContactClass> createState() => _ContactClassState();
}
  class _ContactClassState extends State<ContactClass> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),
            ],
          ),

          body: Container(
            height: 750,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                Padding(padding: EdgeInsets.all(3)),

                Text('Kontakt',
                  style: TextStyle(
                    color: Color(0xFFF3B7BC),
                    fontSize: 30,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Text('Vielen Dank für dein Interesse an Cape Town Rent & Ride! Bei weiteren Fragen oder Anregungen. kannst du uns unter folgenden Wegen erreichen. Wir werden uns schnellstmöglich bei dir melden!', textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF3B7BC),
                    fontSize: 15,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.phone, color: Color(0xFFF3B7BC)),

                                SizedBox(
                                  width: 10,
                                ),

                                Text('Kundenservice',
                                  style: TextStyle(
                                    color: Color(0xFFF3B7BC),
                                    fontSize: 15,
                                  ),
                                ),

                              ],
                            ),

                            SizedBox(
                              height: 25,
                            ),

                            Text('Bei allen Fragen zu deiner \n Bestellung oder Widerruf \n erreichst du uns unter: ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF3B7BC),
                                fontSize: 15,
                              ),
                            ),

                            SizedBox(
                              height: 25,
                            ),

                            Text('+27 123 45678',
                              style: TextStyle(
                                color: Color(0xFFF3B7BC),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.contact_mail_outlined, color: Color(0xFFF3B7BC)),

                                SizedBox(
                                  width: 10,
                                ),

                                Text('Allgemeine Anfragen',
                                  style: TextStyle(
                                    color: Color(0xFFF3B7BC),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 25,
                            ),

                            Text('Nutze bitte das folgende \nKontaktformular bei weiteren \n Fragen oder Anregungen: ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF3B7BC),
                                fontSize: 15,
                              ),
                            ),

                            SizedBox(
                              height: 25,
                            ),

                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF3B7BC),
                              ),
                              icon: Icon(Icons.contact_page_outlined),
                              label: Text('Kontaktformular'),
                              onPressed: () {
                                showDialog(context: context, builder: (context) => AlertDialog(
                                    title: Text('Kontaktformular'),
                                    content:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [

                                          Text('Bitte fülle alle erforderlichen Felder aus (*).'),

                                          Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                focusedBorder:OutlineInputBorder() ,
                                                labelStyle: TextStyle( color: Colors.black45) ,
                                                labelText: "Name*",

                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                focusedBorder:OutlineInputBorder() ,
                                                labelStyle: TextStyle( color: Colors.black45) ,

                                                labelText: "Email*",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                            child: TextFormField(
                                              maxLength: 100, // Maximale Zeichenlänge
                                              maxLengthEnforcement: MaxLengthEnforcement.enforced, // Aktiviere MaxLengthEnforcement
                                              obscureText: true,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                focusedBorder:OutlineInputBorder() ,
                                                labelStyle: TextStyle( color: Colors.black45) ,

                                                labelText: "Deine Nachricht*",
                                              ),
                                            ),
                                          ),],),),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(context), child: Text('Abbruch')),
                                      TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),]

                                ),
                                );
                              },
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  width: 25,
                ),

                Text('Hier findest du uns!',
                  style: TextStyle(
                    color: Color(0xFFF3B7BC),
                    fontSize: 15,
                  ),
                ),

            SizedBox(
              height: 25,
            ),

                Expanded(
                  child: MapClass(),
                ),

                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                  child: Text('Rondebosch, Cape Town,\n 7700, South Africa',
                    style: TextStyle(
                      color: Color(0xFFF3B7BC),
                      fontSize: 15,
                    ),
                  ),
                  ),
                ),

              ],
            ),
      ),
      ),
      );
    }
  }
