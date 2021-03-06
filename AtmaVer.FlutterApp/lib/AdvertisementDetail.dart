import 'dart:ui';

import 'package:flutter/material.dart';

class AdvertisementDetail extends StatelessWidget {
  String imageURL, title, location, type;

  AdvertisementDetail(
      {Key key,
      @required this.imageURL,
      @required this.title,
      @required this.location,
      @required this.type})
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
                margin: EdgeInsets.only(top: 30.0),
                width: MediaQuery.of(context).size.width - 10,
                child: Text(
                  "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.kullanılan mıgır metinlerdir.Lorem Ipsum, dizgi ve baskı",
                  textAlign: TextAlign.left,
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
                            Icon(
                              Icons.account_box,
                              color: Colors.blue,
                              size: 50.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Omer",
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
                        "https://docs.microsoft.com/tr-tr/azure/azure-maps/media/migrate-google-maps-web-app/google-maps-marker.png",
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
          Row(
            children: [
              TextField(
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Ara...",
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
              RaisedButton(
                color: Color.fromARGB(255, 34, 40, 49),
                elevation: 10,
                child: Text(
                  "Gönder",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
