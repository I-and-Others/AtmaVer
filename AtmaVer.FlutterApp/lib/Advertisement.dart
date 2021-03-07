import 'package:flutter/material.dart';

import 'AdvertisementDetail.dart';
import 'main.dart';

class Advertisement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: GridView.count(
        crossAxisSpacing: 4,
        mainAxisSpacing: 80,
        padding:
            EdgeInsets.only(left: 12.0, right: 12.0, top: 25.0, bottom: 25.0),
        crossAxisCount: 2,
        childAspectRatio: (0.7),
        children: [
          createCard(
              imageURL:
                  "https://www.kitantik.com/product/image/0z8kgltjwxgaf7c10bw",
              title: "Kitap",
              location: "İstanbul/Pendik",
              type: "#teklif",
              description:
                  "2.el kitabımı ihtiyaç fazlası olduğu için vermek istiyorum durumu idare eder isteyene kargo ile yollayabilirim."),
          createCard(
            imageURL:
                "https://www.spotikincielalimsatim.com/uploads/urunler/large/IMG_20190725_WA0033.jpg",
            title: "Yemek Masası",
            location: "İstanbul/Arnavutköy",
            type: "#talep",
            description:
                'yeni evlendiğim için evimde yemek masası eksik ve alacak durumumuz yok ihtiyacının fazlası olan varsa talip olabilirim. Elden alınır.',
          ),
          createCard(
            imageURL:
                "https://i.pinimg.com/236x/da/42/89/da4289ab5f8985ee85314bd2909d1482.jpg",
            title: "Gardırop",
            location: "İstanbul/Kadıköy",
            type: "#teklif",
            description:
                'eşimizle yeni gardırop aldığımız için eski gardırobumuzu vermek istiyoruz.Elden teslim.',
          ),
          createCard(
            imageURL:
                "https://gezenbebe.com/wp-content/uploads/2020/06/WhatsApp-Image-2020-06-08-at-17.06.01.jpeg",
            title: "Bebek Arabası",
            location: "İstanbul/Eyüp",
            type: "#talep",
            description:
                '1 aylık bebeğimin bebek arabası eksik ve alacak durumum yok ihtiyac fazlası olan varsa alabilirim.Elden alınır.',
          ),
          createCard(
            imageURL: "https://cf0.lidyana.com/pi/r/3089640/480x720/2",
            title: "Gömlek",
            location: "İstanbul/Şile",
            type: "#teklif",
            description:
                'bana küçük gelen gömleğimi ihtiyaç sahibi birine vermek istiyorum.Kargoya verebilirim.',
          ),
          createCard(
            imageURL:
                "https://img.letgo.com/images/e7/4a/35/1a/e74a351aea3ed46f9af1260bb65941a9.jpeg?impolicy=img_600_pwa",
            title: "Deri Ceket",
            location: "İstanbul/Beşiktaş",
            type: "#teklif",
            description:
                'ihtiyaç fazlası olan deri ceketimi ihtiyacı olan birine vermek istiyorum.Elden verilir.',
          ),
          createCard(
            imageURL:
                "https://img.zet.com/products/29852/175036_29852_1411459701_1000.jpg",
            title: "Pantolon",
            location: "İstanbul/Bebek",
            type: "#teklif",
            description:
                'yeni pantalona ihtiyacım var kendisine olmayan veya ihtiyaç fazlası olan varsa talibim. elden alınır. ',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF00adb5),
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
    @required this.description,
  }) : super(key: key);

  final String imageURL;
  final String title;
  final String location;
  final String type;
  final String description;

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
                      description: description,
                    )),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  imageURL,
                  height: MediaQuery.of(context).size.height * 0.24,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(
                    title.length > 15 ? title.substring(0, 14) + "..." : title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(this.type),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
