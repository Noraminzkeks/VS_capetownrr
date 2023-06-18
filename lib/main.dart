import 'package:caperr/contact.dart';
import 'package:caperr/loading.dart';
import 'package:caperr/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//Stateless = Inhalt immer gleich
//Stateful = Inhalt ändert sich
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Hier wird das Widget gebaut, Build Context ist eine Flutter Library
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cape Town Rent & Ride',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF3B7BC)),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        useMaterial3: true,
        ),

      home: Loading(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // _ heißt nur innerhalb der Klasse verfügbar
  int _counter = 0;

  void _incrementCounter() {
    //setState updatet view
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Absolutes Grundgerüst
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
            Image.asset
              ('assets/images/chapmans.JPG'
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Über den Chapmans Peak nach Noordhoek, am Strand entlang zu den Pinguinen oder quer durch die Stadt. Buche mit uns deine einzigartige E-Bike Tour und erlebe Kapstadt ganz neu. ',
                  textAlign: TextAlign.center,),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactClass()),
                        );
                      },
                      child: Text('Jetzt buchen'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFFFFFFFF),
                          backgroundColor: const Color(0xFFF3B7BC)
                      ),
                    )
                  ],
              ),
            ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(2.0),
                            width: 120.0,
                            height: 100.0,
                            child: Image(
                                image: AssetImage('assets/images/Peninsula3.jpeg'),
                                fit: BoxFit.fill
                                ),
                            ),
                        Container(
                          margin: const EdgeInsets.all(2.0),
                          width: 120.0,
                          height: 100.0,
                          child: Image(
                              image: AssetImage('assets/images/Bo-Kaap.JPEG'),
                              fit: BoxFit.fill
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(2.0),
                          width: 120.0,
                          height: 100.0,
                          child: Image(
                    image: AssetImage('assets/images/Pinguine.JPEG'),
                    fit: BoxFit.fill
                ),
              ),
                      ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      height: 70.0,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Text('Peninsula Route',
                        style: TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left, ),
                        Padding(
                          padding: EdgeInsets.all(3),
                         child:
                        Text('Über den Chapmans Peak nach Noordhoek!',
                        style: TextStyle(height: 1, fontSize: 12),
                        textAlign: TextAlign.center,),
                        ),
                    ],
                ),
                    ),
                    Container(
                      width: 130.0,
                      height: 70.0,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Text('Bo-Kaap City Tour',
                            style: TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left, ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child:
                            Text('Mit den Rädern quer durch das Hippie Viertel!',
                              style: TextStyle(height: 1, fontSize: 12),
                              textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130.0,
                      height: 70.0,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Text('Chapmans Drive',
                            style: TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left, ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child:
                            Text('Natürlich Ausschau halten nach den drolligen Pinguine',
                              style: TextStyle(height: 1, fontSize: 12),
                              textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    width: 120,
                  child: OutlinedButton(
                    onPressed: () { },
                    child: Text('Mehr Details',style: TextStyle(height: 1, fontSize: 12), ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFF3B7BC),
                      backgroundColor: const Color(0xFFFFFFFF),
                      side: BorderSide(color: const Color(0xFFFFFFFF)),
                    ),
                  )
                    ),
                    SizedBox(
                      height: 20,
                      width: 120,
                      child: OutlinedButton(
                        onPressed: () { },
                        child: Text('Mehr Details',style: TextStyle(height: 1, fontSize: 12), ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF3B7BC),
                          backgroundColor: const Color(0xFFFFFFFF),
                          side: BorderSide(color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 120,
                      child: OutlinedButton(
                          onPressed: () { },
                        child: Text('Mehr Details',style: TextStyle(height: 1, fontSize: 12), ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF3B7BC),
                          backgroundColor: const Color(0xFFFFFFFF),
                          side: BorderSide(color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
          ],
        ),
      ),

      //Button rechts unten
    );
  }
}
