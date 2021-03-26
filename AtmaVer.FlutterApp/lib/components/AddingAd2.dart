import 'package:atmaver_real/components/AdDetail.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddingAd2 extends StatefulWidget {
  final String selectedCategory;
  AddingAd2({@required this.selectedCategory});

  @override
  _AddingAd2State createState() =>
      _AddingAd2State(selectedCategory: selectedCategory);
}

class _AddingAd2State extends State<AddingAd2> {
  String selectedCategory;
  String selectedType = '#talep';
  String selectedState = 'Good';
  String dropdownValue = 'One';
  final headerController = TextEditingController();
  final descriptionController = TextEditingController();
  _AddingAd2State({@required this.selectedCategory});

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    headerController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: TextButton(
                      child: Center(
                          child: Text(
                        "+",
                        style: TextStyle(fontSize: 36),
                      )),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Container(
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: TextButton(
                      child: Center(
                          child: Text(
                        "+",
                        style: TextStyle(fontSize: 36),
                      )),
                      onPressed: () {},
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
                          "Category",
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
                              value: selectedCategory,
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
                              items: <String>[
                                selectedCategory,
                                'Technology',
                                'Game',
                                'Home',
                                'Clothing',
                                'Baby',
                                'Decoration',
                                'Book',
                                'Fun',
                                'Others',
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
                              onChanged: (String newValue) {
                                print(newValue);
                                setState(() {
                                  selectedCategory = newValue + " ";
                                });
                              },
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
                          "Type",
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
                              value: selectedType,
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
                                  selectedType = newValue;
                                });
                              },
                              items: <String>[
                                '#talep',
                                '#teklif',
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
                controller:
                    headerController, // bilgiyi almak için headerController.text yapcan
                decoration: InputDecoration(
                  labelText: 'Header',
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
                          "Product State",
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
                              value: selectedState,
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
                                  selectedState = newValue;
                                });
                              },
                              items: <String>[
                                'Good',
                                'Average',
                                'Bad',
                                'Poor'
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
                controller:
                    descriptionController, // bilgiyi almak için descriptionController.text yapcan
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
