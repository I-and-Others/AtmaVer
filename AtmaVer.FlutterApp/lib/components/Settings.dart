import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                child: Text(
                  "Ayarlar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.91,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      "https://i.hizliresim.com/3pDKIs.jpg",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Bilal Cinal",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          height: 1.3,
                        ),
                      )),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.blue,
                size: 30.0,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
