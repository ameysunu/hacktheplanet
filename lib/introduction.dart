import 'package:flutter/material.dart';
import 'package:hacktheplanet/home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(
        fontSize: 18.0, fontFamily: 'Gotham', color: HexColor('#412D61'));
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Gotham',
          color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: HexColor('#845EC2'),
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor: HexColor('#845EC2'),
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Welcome to Extricate",
              body: "We are excited to see you here $name!",
              image: _buildImage('welcome'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Save excess food.",
              body: "PS: These aren't leftovers. Just excess food.",
              image: _buildImage('food'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "It's always happy hour!",
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You are genius for helping, $name.", style: bodyStyle),
                ],
              ),
              image: _buildImage('happy'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip',
              style: TextStyle(fontFamily: 'Gotham', color: Colors.white)),
          next: Icon(
            Icons.arrow_forward,
            color: HexColor('#412D61'),
          ),
          done: const Text('Done',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gotham',
                  color: Colors.white)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFFFFFFF),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildImage(String assetName) {
  return Align(
      child: Image.asset('images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter);
}
