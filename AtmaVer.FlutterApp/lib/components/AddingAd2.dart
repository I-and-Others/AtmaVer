import 'package:atmaver_real/components/AdDetail.dart';
import 'package:flutter/material.dart';

class AddingAd2 extends StatefulWidget {
  @override
  _AddingAd2State createState() => _AddingAd2State();
}

class _AddingAd2State extends State<AddingAd2> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("İlan Ekle"),
      ),
      body: ListView(children: [
        Column(
          children: [
            Container(
              // color: Colors.green,
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 36),
                    )),
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 36),
                    )),
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 36),
                    )),
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 36),
                    )),
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 20),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 36),
                    )),
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                padding: EdgeInsets.only(top: 12),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Kategori",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 10.0),
                          Expanded(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: Colors.black,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'One',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                padding: EdgeInsets.only(top: 12),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Kategori",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 10.0),
                          Expanded(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: Colors.black,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'One',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Başlık',
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                padding: EdgeInsets.only(top: 12),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Durum",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 10.0),
                          Expanded(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: Colors.black,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'One',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Açıklama',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                child: Text(
                  'Yükle',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdDetail(
                            id: 12,
                            imageURL: "lib/assets/gomlek.jpg",
                            title: "eklenen ilan",
                            location: "eklenen ilan",
                            type: "eklenen ilan",
                            description: "eklenen ilan"),
                      ));
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
