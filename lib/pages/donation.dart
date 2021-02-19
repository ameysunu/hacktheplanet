import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

final place = TextEditingController();
final item = TextEditingController();
final description = TextEditingController();
final price = TextEditingController();

DateTime now = DateTime.now();
final firestoreInstance = FirebaseFirestore.instance;

class Donation extends StatefulWidget {
  final String title;
  Donation({Key key, this.title}) : super(key: key);
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  String _imageUrl;

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot =
            await _firebaseStorage.ref().child('images/').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          _imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor('#FFE3EA'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: HexColor('#EC1C64')),
        backgroundColor: HexColor('#FFE3EA'),
        elevation: 0,
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#EC1C64')),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.cancel, color: HexColor('#EC1C64')),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              controller: place,
              style: TextStyle(color: Colors.pink, fontFamily: 'Gotham'),
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black54)),
                hintStyle: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.black54,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                labelStyle: TextStyle(fontFamily: 'Gotham', color: Colors.pink),
                hintText: 'Pickup where?',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              controller: item,
              style: TextStyle(color: Colors.pink, fontFamily: 'Gotham'),
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black54)),
                hintStyle: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.black54,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                labelStyle: TextStyle(fontFamily: 'Gotham', color: Colors.pink),
                hintText: 'Item(s)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              controller: description,
              style: TextStyle(color: Colors.pink, fontFamily: 'Gotham'),
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black54)),
                hintStyle: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.black54,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                labelStyle: TextStyle(fontFamily: 'Gotham', color: Colors.pink),
                hintText: 'Description',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              controller: price,
              style: TextStyle(color: Colors.pink, fontFamily: 'Gotham'),
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black54)),
                hintStyle: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.black54,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                labelStyle: TextStyle(fontFamily: 'Gotham', color: Colors.pink),
                hintText: 'Price(USD)',
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Add an image".toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Gotham', color: Colors.pink, fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: (_imageUrl != null)
                  ? Image.network(_imageUrl)
                  : Image.network('https://i.imgur.com/sUFH1Aq.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
                onPressed: () {
                  uploadImage();
                },
                child: Text(
                  "Upload".toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Gotham',
                  ),
                )),
          ),
          Spacer(),
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
                    if (widget.title == "Food") {
                      firestoreInstance
                          .collection('grocery')
                          .doc('${now.day}${now.month}${now.year}')
                          .set({
                        "description": description.text,
                        "image": _imageUrl.toString(),
                        "name": item.text,
                        "price": price.text,
                      }).then((_) {
                        print("success!");
                      });
                    } else if (widget.title == "Accessory") {
                      firestoreInstance
                          .collection('accessory')
                          .doc('${now.day}${now.month}${now.year}')
                          .set({
                        "description": description.text,
                        "image": _imageUrl.toString(),
                        "name": item.text,
                        "price": price.text,
                      }).then((_) {
                        print("success!");
                      });
                    }
                    clear();
                    Navigator.pop(context);
                  },
                  color: HexColor('#EC1C64'),
                  textColor: HexColor('#FFE3EA'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Submit".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                color: HexColor('#FFE3EA'))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void clear() {
  place.clear();
  item.clear();
  description.clear();
  price.clear();
}
