import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#845EC2'),
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Extricate".toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Gotham', color: Colors.white, fontSize: 25),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Fact: Global Hunger is still a huge problem.",
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 18,
                    color: HexColor('#412D61')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('images/login.png')),
            ),
            Spacer(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ButtonTheme(
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: HexColor('#845EC2'))),
                    onPressed: () {
                      null;
                    },
                    color: Colors.white,
                    textColor: HexColor('#845EC2'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("Get Started".toUpperCase(),
                              style: TextStyle(fontFamily: 'Gotham')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
