import 'package:caperr/main.dart';
import 'package:caperr/touren.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'contact.dart';
import 'settings.dart';

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  final screens = [
    HomeClass(),
    TourenClass(),
    ContactClass(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index], // display based on current index

        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index, // set index
            onTap: (value) {
              setState(() {
                _index = value; // update index, when tab is tapped
              });
            },

            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                label: 'Touren',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page_outlined),
                label: 'Kontakt',
              )
            ]));
  }
}