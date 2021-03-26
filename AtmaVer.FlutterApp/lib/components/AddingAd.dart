import 'package:atmaver_real/components/AddingAd2.dart';
import 'package:flutter/material.dart';

class AddingAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add advertisement"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "Which category?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.phone_android),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: 'Technology'),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Technology",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.green[400],
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.gamepad),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Game"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Game",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.deck_sharp),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Home"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.pink,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.accessibility_new),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Clothing"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Clothing",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.orange,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.baby_changing_station),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Baby"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Baby",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.red,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.lightbulb),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Decoration"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Decoration",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.book),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Book"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Book",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.purple[400],
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.fast_forward_rounded),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Fun"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Fun",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.yellow,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.black,
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddingAd2(selectedCategory: "Others"),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Others",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
