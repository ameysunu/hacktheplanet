import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Home(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: HexColor('#E8DFF1'),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon:
                  new Icon(Icons.dashboard_rounded, color: HexColor('#5C6178')),
              title: new Text(
                'Home',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart_outlined,
                  color: HexColor('#5C6178')),
              title: new Text(
                'Cart',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.money_rounded, color: HexColor('#5C6178')),
              title: new Text(
                'Donate',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person, color: HexColor('#5C6178')),
              title: new Text(
                'User',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
