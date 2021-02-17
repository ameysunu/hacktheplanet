import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacktheplanet/pages/maps.dart';
import 'package:hexcolor/hexcolor.dart';

class ShopList extends StatefulWidget {
  final String name, price, description, image;
  ShopList({Key key, this.name, this.price, this.description, this.image})
      : super(key: key);
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3EA'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: Colors.black,
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.dstATop),
                      image: NetworkImage(widget.image),
                      fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.chevron_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.name.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.price.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 18,
                            color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.store,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 18,
                          color: Colors.pink),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Maps(
                                      title: widget.name,
                                      place: widget.description,
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
      ),
    );
  }
}
