import 'package:flutter/material.dart';

import 'AdvertisementDetail.dart';

import 'main.dart';

class Advertisement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisSpacing: 14,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        children: [
          createCard(
              imageURL:
                  "https://www.kitantik.com/product/image/0z8kgltjwxgaf7c10bw",
              title: "Kitap",
              location: "istanbul, pendik",
              type: "#teklif"),
          createCard(
              imageURL:
                  "https://www.spotikincielalimsatim.com/uploads/urunler/large/IMG_20190725_WA0033.jpg",
              title: "Yemek Masası",
              location: "istanbul, arnavutköy",
              type: "#talep"),
          createCard(
              imageURL:
                  "https://i.pinimg.com/236x/da/42/89/da4289ab5f8985ee85314bd2909d1482.jpg",
              title: "Gardırop",
              location: "düzce, merkez",
              type: "#teklif"),
          createCard(
              imageURL:
                  "https://gezenbebe.com/wp-content/uploads/2020/06/WhatsApp-Image-2020-06-08-at-17.06.01.jpeg",
              title: "Bebek Arabası",
              location: "düzce, merkez",
              type: "#teklif"),
          createCard(
              imageURL:
                  "https://image5.sahibinden.com/photos/57/11/81/x5_6355711813h1.jpg",
              title: "Gömlek",
              location: "Antalya, Kaş",
              type: "#teklif"),
          createCard(
              imageURL:
                  "https://img.letgo.com/images/e7/4a/35/1a/e74a351aea3ed46f9af1260bb65941a9.jpeg?impolicy=img_600_pwa",
              title: "Deri Ceket",
              location: "Ankara, Çankaya",
              type: "#teklif"),
          createCard(
              imageURL:
                  "https://img.zet.com/products/29852/175036_29852_1411459701_1000.jpg",
              title: "Pantolon",
              location: "Bursa, Orhangazi",
              type: "#teklif"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

// ignore: camel_case_types
class createCard extends StatelessWidget {
  const createCard({
    Key key,
    @required this.imageURL,
    @required this.title,
    @required this.location,
    @required this.type,
  }) : super(key: key);

  final String imageURL;
  final String title;
  final String location;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AdvertisementDetail(
                      imageURL: imageURL,
                      title: title,
                      location: location,
                      type: type,
                    )),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    imageURL,
                    height: 110.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    title.length > 15 ? title.substring(0, 14) + "..." : title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    location.length > 15
                        ? location.substring(0, 14) + "..."
                        : location,
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    type,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
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
