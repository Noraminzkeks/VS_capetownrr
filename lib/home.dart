import 'package:flutter/material.dart';
import 'index.dart';
import 'login.dart';
import 'touren.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class HomeClass extends StatelessWidget {
  HomeClass({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  //Aufruf der Signout-Funktion aus Auth.dart
  Future<void> signOut() async {
    await Auth().signOut();
  }

  //Email-Adresse des aktuell eingeloggten Nutzers
  Widget _userID() {
    return Text(user?.email ?? 'User-email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Absolutes Grundgerüst
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
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              _userID(),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginClass()),
                  );
                  signOut;
                },
                child: const Text('Sign Out'),
              ),
            ]),
            Image.asset('assets/images/chapmans.JPG'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Über den Chapmans Peak nach Noordhoek, am Strand entlang zu den Pinguinen oder quer durch die Stadt. Buche mit uns deine einzigartige E-Bike Tour und erlebe Kapstadt ganz neu. ',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TourenClass()),
                        );
                      },
                      child: Text('Jetzt buchen'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFFFFFFFF),
                          backgroundColor: const Color(0xFFF3B7BC)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 120.0,
                      height: 100.0,
                      child: Image(
                          image: AssetImage('assets/images/Peninsula3.jpeg'),
                          fit: BoxFit.fill),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 120.0,
                      height: 100.0,
                      child: Image(
                          image: AssetImage('assets/images/Bo-Kaap.JPEG'),
                          fit: BoxFit.fill),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 120.0,
                      height: 100.0,
                      child: Image(
                          image: AssetImage('assets/images/Pinguine.JPEG'),
                          fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      height: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Peninsula Route',
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Über den Chapmans Peak nach Noordhoek!',
                              style: TextStyle(height: 1, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130.0,
                      height: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Bo-Kaap City Tour',
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Mit den Rädern quer durch das Hippie Viertel!',
                              style: TextStyle(height: 1, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130.0,
                      height: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Simons Town',
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Natürlich Ausschau halten nach den drolligen Pinguine',
                              style: TextStyle(height: 1, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        height: 20,
                        width: 120,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TourenClass()),
                            );
                          },
                          child: Text(
                            'Mehr Details',
                            style: TextStyle(height: 1, fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFF3B7BC),
                            backgroundColor: const Color(0xFFFFFFFF),
                            side: BorderSide(color: const Color(0xFFFFFFFF)),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                      width: 120,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TourenClass()),
                          );
                        },
                        child: Text(
                          'Mehr Details',
                          style: TextStyle(height: 1, fontSize: 12),
                        ),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TourenClass()),
                          );
                        },
                        child: Text(
                          'Mehr Details',
                          style: TextStyle(height: 1, fontSize: 12),
                        ),
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
            const SizedBox(height: 30),
          ],
        ),
      ),

      //Button rechts unten
    );
  }
}
