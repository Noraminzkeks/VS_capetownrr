import 'package:caperr/main.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'buchenkaap.dart';

class BoKaapClass extends StatefulWidget {
  const BoKaapClass ({super.key});

  @override
  State<BoKaapClass> createState() => _BoKaapClassState();
}
class _BoKaapClassState extends State<BoKaapClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
          backgroundColor: const Color(0xFFF3B7BC),

          title: Row
            (
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 30,),
              Container(padding: const EdgeInsets.all(20.0), child: Text('Cape Town Rent & Ride', style: TextStyle(fontFamily: 'Roboto', color: Colors.black),))
            ],
          )
      ),
      body: SingleChildScrollView(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ImageSlideshow(
              indicatorColor: const Color(0xFFF3B7BC),
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 5000,
              isLoop: true,
              children: [
                Image.asset(
                  'assets/images/TableHaus.JPEG',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/Spices.JPEG',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/Bo-Kaap.JPEG',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/AutoBlau.JPEG',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child:Icon(
                        Icons.electric_bike,
                        color: Colors.black54,
                        size: 50.0,
                        semanticLabel: 'Bike',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:40, bottom: 20),
                      child: Container(
                          width: 75,
                          child:Text('E-Bike empfohlen', style: TextStyle(fontWeight: FontWeight.w500),)
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child:Icon(
                        Icons.date_range_sharp,
                        color: Colors.black54,
                        size: 50.0,
                        semanticLabel: 'Termin',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20, bottom: 20),
                      child: Container(
                          width: 70,
                          child:Text('Termine verfügbar', style: TextStyle(fontWeight: FontWeight.w500),)
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child:Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 25.0,
                            semanticLabel: 'Stern',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 25.0,
                            semanticLabel: 'Stern',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 25.0,
                            semanticLabel: 'Stern',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 25.0,
                            semanticLabel: 'Stern',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 25.0,
                            semanticLabel: 'Stern',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20, bottom: 20),
                      child: Container(
                          width: 70,
                          child:Text('4.9 von 5 Sternen', style: TextStyle(fontWeight: FontWeight.w500),)
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Divider(
                  color: Colors.black
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Für die Bo-Kaap City Tour treffen wir uns 30 Minuten vor Tourenbeginn am Meeting Point Kloof Street. Hier werden alle mit E-Bikes ausgestattet. Von dort aus sind es ungefähr 10 Minuten in das belebte Stadtviertel Bo-Kaap. Da es hier auch ordentlich bergauf geht, wird ein E-Bike hier wärmstens empfohlen. Nach einer kleinen Tour durch die Stadt, habt ihr die Möglichkeit im Ältesten Gewürzshop Kapstadts einzukaufen, bevor wir uns langsam wieder auf den Rückweg machen. Nach anderthalb Stunden sind wir wieder zurück am Meeting Point.'),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Divider(
                  color: Colors.black
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, right: 20, bottom: 15, top: 15),
              child: SizedBox(
                  height: 50,
                  width: 250,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BuchenKaapClass()),
                    );
                  },
                  child: Text('Tour auswählen',style: TextStyle(height: 1, fontSize: 15), ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFFFFFF),
                    backgroundColor: const Color(0xFFF3B7BC),
                    side: BorderSide(color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

