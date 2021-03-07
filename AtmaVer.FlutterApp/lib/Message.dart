import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilal Cinal"),
      ),
      body: BottomSide(),
    );
  }
}

class BottomSide extends StatelessWidget {
  const BottomSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  // style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Mesaj Gönder",
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
              RaisedButton(
                color: Color.fromARGB(255, 34, 40, 49),
                elevation: 10,
                child: Text(
                  "Gönder",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
