import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'index.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  String? errorMessage = '';

  //Hiermit wird später abgeprüft ob Login oder Registrierung stattfinden soll
  bool isLogin = true;

  //Initialisierung der Textfeld-Controller
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  //Login-Funktion
  Future<void> signInWithEmailAndPassword() async {
    try {
      //Aufruf der Methode signIn aus Auth.dart mit den Parametern aus den Controllern
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      //Wenn erfolgreich, wird auf die HomeSeite weitergeleitet
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Index()),
      );
      //wenn nicht werden die vorgegeben Fehlermeldungen ausgegeben
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  //Registrierungsfunktion
  Future<void> createUserWithEmailAndPassword() async {
    try {
      //Aufruf der Methode createUser aus Auth.dart mit den Parametern email und passwort
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      //Bei Erfolg wird auf die Home-Seite weitergeleitet
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Index()),
      );
      //Sonst Ausgabe der Fehlermeldung
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  //Styling für Eingabefeld "Mail"
  Widget _mailentryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  //Styling für Eingabefeld "Passwort"
  Widget _passwordentryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      //Passwort wird nicht angezeigt
      obscureText: true,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  //Error-Messages sind von Firebase vorgebeben
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  //Je nach Wert der boolean isLogin wird entweder Login oder Register auf dem Submit Button angezeigt
  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFF3B7BC),
        side: BorderSide(color: const Color(0xFFFFFFFF)),
      ),
    );
  }

  //wird auf diesen Button geklickt, wird der Wert der Boolean getauscht und bei true "Register instead" angezeigt
  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
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
                    style: TextStyle(fontFamily: 'Roboto', color: Colors.white),
                  ))
            ],
          ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(isLogin ? 'Willkommen zurück!' : 'Herzlich Willkommen!',
              style: TextStyle(
                  height: 1,
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic)),
          const SizedBox(height: 35),
          SizedBox(
            width: 250,
            child: Image.asset(
              'assets/images/CapeTownRentRide.jpg',
              fit: BoxFit.contain,
              height: 70,
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: 250,
            child: _mailentryField('email', _controllerEmail),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 250,
            child: _passwordentryField(
              'password',
              _controllerPassword,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 250,
            //Aufrufen der einzelnen Widgets von oben
            child: _errorMessage(),
          ),
          _submitButton(),
          _loginOrRegisterButton(),
        ])),
      ),
    );
  }
}
