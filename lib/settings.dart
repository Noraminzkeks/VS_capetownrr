import 'package:flutter/material.dart';


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

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.question_mark_outlined, color: Colors.white),
            onPressed: () {showDialog(context: context, builder: (context) => AlertDialog(
                title: Text('Hilfe'),
                content: Text('Hier kannst du grundlegende Einstellungen ändern!'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),]
            ),
            );
            },
          ),
        ],
      ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const SizedBox(height:25),

              Card(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: Color(0xfff3b7bc),
                    ),
                    Text('  Select Language'),
                    Spacer(),
                    DropdownButtonExample(),
                  ],
                ),
              ),

              Card(
                child: Row(
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
              ),



                    ElevatedButton.icon(   // <-- ElevatedButton
                      onPressed: () {

                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Erfolgreich ausgeloggt.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Erfolgreich ausgeloggt.'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Color(0xfff3b7bc),
                        size: 24.0,
                      ),
                      label: const Text('Ausloggen'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size(175, 60),
                      ),
                    ),

                  ],
          ),
        ),

    );
  }
}