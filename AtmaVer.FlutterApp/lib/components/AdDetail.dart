import 'package:flutter/material.dart';

class AdDetail extends StatelessWidget {
  final String imageURL, title, location, type, description;
  final int id;
  AdDetail(
      {Key key,
      @required this.id,
      this.imageURL,
      @required this.title,
      @required this.location,
      @required this.type,
      @required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("İlan Detay"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Image.asset(
                  this.imageURL != null ? this.imageURL : null,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 300,
                  fit: BoxFit.cover,
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Text(this.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.91,
                  child: Text(
                    this.description,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.91,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              "https://i.hizliresim.com/3pDKIs.jpg",
                              width: 50,
                              height: 50,
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
                                    fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          "https://i.hizliresim.com/rPsny7.png",
                          width: MediaQuery.of(context).size.width - 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(this.location,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Mesaj Gönder',
                            hintStyle:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          iconSize: 26.0,
                          icon: const Icon(Icons.send),
                          tooltip: 'Filter',
                          onPressed: () {
                            // ignore: unnecessary_statements
                            null;
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
