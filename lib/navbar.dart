import 'package:flutter/material.dart';


class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  final screens = [
    //Hier Klassen einzeln aufrufen - bsp: Register(), Home(), etc.
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
                icon: Icon(Icons.add_circle_outline),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              )
            ]));
  }
}