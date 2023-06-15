import 'package:caperr/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}
  class _LoginClassState extends State<LoginClass> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title(){
    return const Text('Firebase Auth');
  }

  Widget _entryField(
      String title,
      TextEditingController controller) {
    return TextField(controller: controller,
    decoration: InputDecoration(labelText: title,
    ),
    );
  }

  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton(){
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton(){
    return TextButton(
      onPressed: () {setState(() {
        isLogin = !isLogin;
      });},
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

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
          body:  Center(
            child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _entryField('email', _controllerEmail),
                  _entryField('password', _controllerPassword),
                  _errorMessage(),
                  _submitButton(),
                  _loginOrRegisterButton(),
                  const SizedBox(height: 35),
                  Text('Willkommen zurück!', style: TextStyle(height: 1, fontSize: 25, fontFamily:'Roboto' , fontStyle: FontStyle.italic)),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 250,
                    child: Image.asset('assets/images/CapeTownRentRide.jpg',fit: BoxFit.contain,height: 70,),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Benutzername',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Passwort',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
            SizedBox(
                height: 50,
                width: 250,
                child: OutlinedButton(
                  onPressed: () { },
                  child: Text('Anmelden',style: TextStyle(height: 1, fontSize: 15), ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFFFFFF),
                    backgroundColor: const Color(0xFFF3B7BC),
                    side: BorderSide(color: const Color(0xFFFFFFFF)),
                  ),
                )
            ),
            ]
            )
          ),
          ),
      );
    }
  }

