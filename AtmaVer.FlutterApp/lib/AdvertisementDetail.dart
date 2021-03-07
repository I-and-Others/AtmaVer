import 'dart:ui';

import 'package:atmaver_demo/Message.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdvertisementDetail extends StatelessWidget {
  String imageURL, title, location, type, description;

  AdvertisementDetail(
      {Key key,
      @required this.imageURL,
      @required this.title,
      @required this.location,
      @required this.type,
      @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(
                  this.imageURL,
                  height: 400.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                margin: EdgeInsets.only(top: 50.0, bottom: 40.0),
                width: MediaQuery.of(context).size.width - 0,
                child: Text(
                  this.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    height: 1.3,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                margin: EdgeInsets.only(top: 30.0),
                width: MediaQuery.of(context).size.width - 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image.network(
                                "https://i.hizliresim.com/3pDKIs.jpg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Bilal Cinal",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                        "https://i.hizliresim.com/rPsny7.png",
                        width: MediaQuery.of(context).size.width - 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Center(
                      child: Text(
                        "34890 / ${this.location}",
                        style: TextStyle(
                            fontSize: 20.0,
                            height: 1.3,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            // width: MediaQuery.of(context).size.width - 50,
            margin: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: TextField(
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                hintText: "Mesaj Gönder",
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 40.0,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              color: Color(0xFF00adb5),
              elevation: 10,
              child: Text(
                "Gönder",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Message(),
                    ))
              },
            ),
          ),

          // ignore: deprecated_member_use
        ],
      ),
    );
  }
}
