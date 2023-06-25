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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              //Überschrift und Erklärung
              Padding(padding: EdgeInsets.all(3)),

              Text('Kontakt',
                style: TextStyle(
                  color: Color(0xFFF3B7BC),
                  fontSize: 20,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text('Vielen Dank für dein Interesse an Cape Town Rent & Ride! Bei weiteren Fragen oder Anregungen. kannst du uns unter folgenden Wegen erreichen.', textAlign: TextAlign.center,
                style: TextStyle(
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

                  Container(
                    width: 180,
                    height: 200,
                    //Kundenservice Card
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.phone, color: Color(0xFFF3B7BC)),
                                Text('Kundenservice',
                                  style: TextStyle(
                                    color: Color(0xFFF3B7BC),
                                    fontSize: 15,
                                  ),
                                ),

                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Text('Bei allen Fragen zu deiner \n Bestellung oder Widerruf \n erreichst du uns unter: ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
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
                  ),

                  Container(
                    width: 180,
                    height: 200,
                    //Kontaktformular Card
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.contact_mail_outlined, color: Color(0xFFF3B7BC)),

                                Text(' Allg. Anfragen',
                                  style: TextStyle(
                                    color: Color(0xFFF3B7BC),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Text('Nutze das folgende \nKontaktformular bei \n Fragen oder Anregungen: ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //Button um Kontaktformular aufzurufen
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF3B7BC),
                              ),
                              icon: Icon(Icons.contact_page_outlined),
                              label: Text('Kontaktformular',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),

                              //Öffnen eines Pop Up beim Klicken
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

                                          //Formfield: Name
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

                                        //Formfield: Email
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
                                        //Formfield: Nachricht
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                            child: TextFormField(
                                              maxLength: 100, // Maximale Zeichenlänge
                                              maxLengthEnforcement: MaxLengthEnforcement.enforced, // Aktiviere MaxLengthEnforcement
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

                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              // Einbinden der Map
              Expanded(
                child: MapClass(),
              ),

              // Addressen Card
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Icon(Icons.location_on_outlined, size: 20),

                      Text('Hier findest du uns!',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(
                        width: 20,
                      ),

                      Text('Rondebosch, Cape Town,\n 7700, South Africa', textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
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