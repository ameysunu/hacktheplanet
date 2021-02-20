import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login.dart';
import 'package:url_launcher/url_launcher.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.pink,
                              child: Image.network(imageUrl),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: HexColor('#FFE3EA'),
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  email,
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: HexColor('#FFE3EA'),
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ButtonTheme(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: HexColor('#FFE3EA'))),
                          onPressed: () {
                            signOutGoogle();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          color: Colors.white,
                          textColor: Colors.pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("Logout".toUpperCase(),
                                    style: TextStyle(fontFamily: 'Gotham')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewInfo(
                                title: 'What is Extricate?',
                              )));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              CupertinoIcons.info_circle_fill,
                              color: HexColor('#FFE3EA'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "What is this exactly?",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: HexColor('#FFE3EA'),
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  const url =
                      'https://github.com/ameysunu/hacktheplanet/issues';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.warning,
                              color: HexColor('#FFE3EA'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Report issues here",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: HexColor('#FFE3EA'),
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewInfo extends StatefulWidget {
  final String title;
  NewInfo({this.title});
  @override
  _NewInfoState createState() => _NewInfoState();
}

class _NewInfoState extends State<NewInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#FFE3EA')),
        ),
      ),
      backgroundColor: Colors.pink,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "We are glad, you asked. Extricate is an app that helps people save money and also help in decrease of climate change. How you may ask? Pretty simple. Let's begin with food wastage. With Extricate, you can save the excess food cooked up at restaurants by buying them for a cheaper price or giving them away to the needy.\n\nPS: These are'nt leftovers. They are just food that was cooked in excess. Users can also purchase accessories at a cheaper rate. These are accessories which are about to expire. We do not encourage selling off expired items and hence all the items are atleast a month due expiry.\n\n You can also sell off/give away items and excess food as well. With Extricate, let's make our planet a better place.!",
              style: TextStyle(
                  fontFamily: 'Gotham',
                  color: HexColor('#FFE3EA'),
                  fontSize: 16,
                  height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
