import 'package:flutter/material.dart';
import 'package:hacktheplanet/pages/donation.dart';
import 'package:hexcolor/hexcolor.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Want to donate?",
                  style: TextStyle(
                      color: HexColor('#FFE3EA'),
                      fontFamily: 'Gotham',
                      fontSize: 25),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Donation(
                                        title: "Food",
                                      )));
                        },
                        fillColor: HexColor('#C33589'),
                        child: Icon(
                          Icons.food_bank,
                          size: 50.0,
                          color: HexColor('#FFE3EA'),
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Food",
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#FFE3EA'),
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Donation(
                                        title: "Accessory",
                                      )));
                        },
                        fillColor: HexColor('#C33589'),
                        child: Icon(
                          Icons.local_grocery_store,
                          size: 50.0,
                          color: HexColor('#FFE3EA'),
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Accessory",
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#FFE3EA'),
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset('images/donate.png')),
            ),
          ],
        ),
      ),
    );
  }
}
