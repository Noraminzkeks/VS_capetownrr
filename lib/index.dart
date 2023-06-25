import 'package:flutter/material.dart';
import 'navbar.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index>{
  final _formKey = GlobalKey<FormState>();

  //Aufruf der Navbar mit der Klasse BottomTabBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BottomTabBar(),);
  }
}