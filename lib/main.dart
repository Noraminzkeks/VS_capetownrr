import 'package:caperr/home.dart';
import 'package:caperr/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'buchen.dart';
import 'firebase_options.dart';
import 'loading.dart';
import 'login.dart';

Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
      apiKey: "AIzaSyBVTmhhfXR2ALkNay4EYzNguhEhPV0cpp4",
      projectId: "capetownrr-868d2",
        databaseURL: 'https://capetownrr-868d2-default-rtdb.europe-west1.firebasedatabase.app',
      messagingSenderId: "661529258039",
      appId: "1:661529258039:web:0e2b993a2c5c71d63b37b2",


      ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Hier wird das Widget gebaut, Build Context ist eine Flutter Library
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cape Town Rent & Ride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF3B7BC)),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        useMaterial3: true,
      ),

      home: Loading(),
    );
  }
}


