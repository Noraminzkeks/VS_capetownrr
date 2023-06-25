import 'package:caperr/home.dart';
import 'package:caperr/main.dart';
import 'package:caperr/settings.dart';
import 'package:flutter/material.dart';
import 'buchen.dart';
import 'index.dart';
//Shared Preferences speichert in einer Art Zwischenspeicher vom User ausgewählte Einstellungen
import 'package:shared_preferences/shared_preferences.dart';

//Diese Page wird nicht verwendet!!
//Ausprobieren der Platzanzahl-Reduktion mit dem Package "Shared Preferences"

//Initalisierung der drei DropDownMenüs
class MyDropdownMenu extends StatefulWidget {
  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  int counter1 = 15;
  int counter2 = 12;
  int counter3 = 5;
  int counter = 0;
  List<String> options = [
    'Datum auswählen', '30.07.2023', '03.07.2023', '15.07.2023'];
  int selectedValue1 = 0;

  //lädt die Counter aus dem Zwischenspeicher
  @override
  void initState() {
    super.initState();
    loadCounter1();
    loadCounter2();
    loadCounter3();
  }

  //eine Lade-Funktion für jeden Counter
  //Future & Async => vor dem Laden müssen Informationen geladen werden
  Future<void> loadSelectedValue1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedValue1 = prefs.getInt('selectedValue1') ?? 0;
    });
  }

  Future<void> loadCounter1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter1 = prefs.getInt('counter1') ?? 15;
    });
  }
  Future<void> loadCounter2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter2 = prefs.getInt('counter2') ?? 12;
    });
  }
  Future<void> loadCounter3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter3 = prefs.getInt('counter3') ?? 5;
    });
  }

  Future<void> saveselectedValue1(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedValue1 = value;
      prefs.setInt('selectedValue1', value);
    });
  }

  Future<void> saveCounter1(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter1 = value;
      prefs.setInt('counter1', value);
    });
  }
  Future<void> saveCounter2(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter2 = value;
      prefs.setInt('counter2', value);
    });
  }
  Future<void> saveCounter3(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter3 = value;
      prefs.setInt('counter3', value);
    });
  }

  //je "Selected Valaue" also Zeile im Dropdown wird der Counter um eins verringert
  Future<void> decreaseCounter(int decrease) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedValue1 = prefs.getInt('selectedValue1') ?? 0;
    if(selectedValue1==1){
      int counter1 = prefs.getInt('counter1') ?? 0;
      counter1 -= decrease;
      prefs.setInt('counter1', counter1);
      setState(() {
        this.counter1 = counter1;
      });
      saveCounter1(counter1);
    }
    else if(selectedValue1==2){
      int counter2 = prefs.getInt('counter2') ?? 0;
      counter2 -= decrease;
      prefs.setInt('counter2', counter2);
      setState(() {
        this.counter2 = counter2;
      });
      saveCounter2(counter2);
    }
    else{
      int counter3 = prefs.getInt('counter3') ?? 0;
      counter3 -= decrease;
      prefs.setInt('counter3', counter3);
      setState(() {
        this.counter3 = counter3;
      });
      saveCounter3(counter3);
    }
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedValue1,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      items: options.map((String option) {
        if(options.indexOf(option)==0){
          return DropdownMenuItem<int>(
            value: options.indexOf(option),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Colors.black,
                    size: 25.0,
                    semanticLabel: 'Datum',
                  ),
                  Text(option),
                ],
              ),
            ),
          );
        }
        if(options.indexOf(option)==1){
          counter = counter1;
        }
        else if(options.indexOf(option)==2){
          counter = counter2;
        }
        else{
          counter = counter3;
        }
        return DropdownMenuItem<int>(
          value: options.indexOf(option),
          child: Row(
            children: [
              Text(option),
              Text('  Plätze verfügbar: $counter'),
            ],
          ),
        );
      }).toList(),
      onChanged: (int? newValue) {
        setState(() {
          selectedValue1 = newValue!;
          saveselectedValue1(newValue! as int);
        });
      },
    );
  }
}

List<DropdownMenuItem<String>> get dropdownBikes {
  List<DropdownMenuItem<String>> listbike = [
    DropdownMenuItem(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.directions_bike_outlined,
                color: Colors.black,
                size: 25.0,
                semanticLabel: 'Bike',
              ),
              Text('  Anzahl E-Bikes'),
            ],
          ),
        ),
        value: "0"),
    DropdownMenuItem(child: Text('1 E-Bike '), value: "1"),
    DropdownMenuItem(child: Text('2 E-Bikes '), value: "2"),
    DropdownMenuItem(child: Text('3 E-Bikes '), value: "3"),
    DropdownMenuItem(child: Text('4 E-Bikes '), value: "4"),
  ];
  return listbike;
}

class DropdownButtonBike extends StatefulWidget {
  const DropdownButtonBike({super.key});

  @override
  State<DropdownButtonBike> createState() => _DropdownButtonBikeState();
}

class _DropdownButtonBikeState extends State<DropdownButtonBike> {
  static String selectedValue2 = "0";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue2,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue2 = newValue!;
        });
      },
      items: dropdownBikes,
    );
  }
}

List<DropdownMenuItem<String>> get dropdownKids {
  List<DropdownMenuItem<String>> listKids = [
    DropdownMenuItem(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.pedal_bike,
                color: Colors.black,
                size: 25.0,
                semanticLabel: 'Bike',
              ),
              Text('  Anzahl E-Bikes Kids'),
            ],
          ),
        ),
        value: "0"),
    DropdownMenuItem(child: Text('1 E-Bike Kid '), value: "1"),
    DropdownMenuItem(child: Text('2 E-Bikes Kids '), value: "2"),
    DropdownMenuItem(child: Text('3 E-Bikes Kids '), value: "3"),
    DropdownMenuItem(child: Text('4 E-Bikes Kids '), value: "4"),
  ];
  return listKids;
}

class DropdownButtonKids extends StatefulWidget {
  const DropdownButtonKids({super.key});

  @override
  State<DropdownButtonKids> createState() => _DropdownButtonKidsState();
}

class _DropdownButtonKidsState extends State<DropdownButtonKids> {
  static String selectedValue3 = "0";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue3,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color(0xfff3b7bc),
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue3 = newValue!;
        });
      },
      items: dropdownKids,
    );
  }
}

class BuchenClass extends StatefulWidget {
  const BuchenClass({super.key});

  @override
  State<BuchenClass> createState() => _BuchenClassState();
}

class _BuchenClassState extends State<BuchenClass> {

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
                    style: TextStyle(color: Colors.white),
                  ))
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('PENINSULA ROUTE',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('3h',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                          fontSize: 15)),
                  Text('Meeting Point: Hout Bay',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                          fontSize: 15)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Vicky.JPEG'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    child: Text('Dein Guide: Vicky',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black87,
                            fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: Divider(color: Colors.black87),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: MyDropdownMenu(),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: DropdownButtonBike(),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: DropdownButtonKids(),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  border: Border.all(color: const Color(0x00000000))),
              child: Text('Die Grundgebühr für diesen Kurs beträgt 45€ pro Person und beinhaltet die geführte Tour sowie die Leihgebühr eines E-Bikes inklusive Helm. Die Tour kann bis zu 48 Stunden vorher kostenfrei storniert werden. Kann die Tour aufgrund von Wetter oder Verkehr nicht stattfinden, werden wir dich telefonisch informieren. Wir freuen uns auf dich!', style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black54,
                  fontSize: 10)),
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => Index())
                  );
                  int decrease = (_DropdownButtonBikeState.selectedValue2 as int) + (_DropdownButtonKidsState.selectedValue3 as int);
                  _MyDropdownMenuState().decreaseCounter(decrease);
                },
                child: Text('Buchung abschließen'),
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFFFFFF),
                    backgroundColor: const Color(0xFFF3B7BC)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}