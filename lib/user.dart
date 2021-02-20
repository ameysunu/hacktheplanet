import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3EA'),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: AssetImage('images/back.png'),
                      fit: BoxFit.cover)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'User'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Gotham', color: Colors.pink, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
