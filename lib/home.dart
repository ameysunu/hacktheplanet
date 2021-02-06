import 'package:flutter/material.dart';
import 'package:hacktheplanet/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "What do you feel like having?".toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Gotham', color: Colors.white, fontSize: 17),
              ),
            ),
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFE8ED'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Vegetables and Fruits",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#E5808E'),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFE8ED'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Grain and Bread",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#E5808E'),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFE8ED'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Milk Products",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#E5808E'),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFE8ED'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Non Vegetarian",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#E5808E'),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFE8ED'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Fast Food",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#E5808E'),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFE8ED'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Vegan Options",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#E5808E'),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
