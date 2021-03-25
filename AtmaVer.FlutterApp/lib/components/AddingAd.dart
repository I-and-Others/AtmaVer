import 'package:atmaver_real/components/AddingAd2.dart';
import 'package:flutter/material.dart';

class AddingAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("İlan Ekle"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Hangi kategori?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
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
                                  builder: (context) => AddingAd2(),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Teknoloji",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green[400],
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.gamepad),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Oyun",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.deck_sharp),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Ev Eşyaları",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.phone_android),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Teknoloji",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green[400],
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.gamepad),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Oyun",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.deck_sharp),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Ev Eşyaları",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.phone_android),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Teknoloji",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green[400],
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.gamepad),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Oyun",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.deck_sharp),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Ev Eşyaları",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.phone_android),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Teknoloji",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green[400],
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.gamepad),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Oyun",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          color: Colors.white,
                          icon: const Icon(Icons.deck_sharp),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Ev Eşyaları",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
