import 'package:flutter/material.dart';
import 'package:hacktheplanet/pages/maps.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../items.dart';

DateTime now = DateTime.now();
String newDate = DateFormat('EEE d MMM, kk:mm').format(now);

class Food extends StatefulWidget {
  final String title, price, place, image;
  const Food({
    Key key,
    this.title,
    this.price,
    this.place,
    this.image,
  }) : super(key: key);
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EC1C64'),
      appBar: AppBar(
        backgroundColor: HexColor('#EC1C64'),
        elevation: 0,
        iconTheme: IconThemeData(color: HexColor('#FFE3EA')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 20,
                  color: HexColor('#FFE3EA')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.place,
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 17,
                  color: HexColor('#41135E')),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.network(widget.image),
              ),
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: HexColor('#FFE3EA')),
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    widget.price,
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 18,
                        color: HexColor('#41135E')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: HexColor('#EC1C64'))),
                        onPressed: () async {
                          firestoreInstance
                              .collection('cart')
                              .doc('${now.day}${now.month}${now.year}')
                              .set({
                            "title": widget.title,
                            "price": widget.price,
                            "id": '${now.day}${now.month}${now.year}',
                            "image": widget.image,
                          }).then((_) {
                            print("success!");
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Maps(
                                        place: widget.place,
                                        title: widget.title,
                                      )));
                        },
                        color: HexColor('#EC1C64'),
                        textColor: HexColor('#FFE3EA'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("Get Directions".toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: HexColor('#41135E'))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
