import 'package:flutter/material.dart';
import 'package:hacktheplanet/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

var time = DateTime.now().hour;
var min = DateTime.now().minute;

var newTime = DateTime.now();
String formattedDate = DateFormat('kk:mm').format(newTime);

String greeting = greetings();

String greetings() {
  if (time < 12) {
    return 'Good Morning';
  }
  if (time < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: HexColor('#FFE3EA'),
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage('images/back.png'),
                  fit: BoxFit.cover,
                )),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      greeting.toUpperCase() + " ,",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color: Colors.pink,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "$name",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color: HexColor('#EC1C64'),
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "What do you feel like having?",
              style: TextStyle(
                  fontFamily: 'Gotham', color: Colors.white, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
