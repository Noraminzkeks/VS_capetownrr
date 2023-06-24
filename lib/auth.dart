import 'package:firebase_auth/firebase_auth.dart';
// Hier wird definiert, was für die Anmeldung erforderlich ist und die Verbindung zu Firebase hergestellt

class Auth {
  //feste Struktur von Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  //Echtzeitaktualisierung
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //Login-Funktion
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    //Abgleich mit Firebase Datenbank
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Registrierungsfunktion
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

//Signout - Funktion von Firebase
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
