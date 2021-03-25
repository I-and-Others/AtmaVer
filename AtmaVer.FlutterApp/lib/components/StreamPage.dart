import 'package:atmaver_real/components/AdDetail.dart';
import 'package:atmaver_real/components/AddingAd.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.height / 1250,
          children: [
            StreamCard(
              id: 0,
              imageURL: "lib/assets/gomlek.jpg",
              title: "Gömlek",
              location: "İstanbul/Bahçelievler",
              type: "#talep",
              description:
                  "2. el gömlek. İhtiyacı olan mesaj atabilir. Kargo ücreti benden. Az giyilmiş, temizdir.",
            ),
            StreamCard(
              id: 1,
              imageURL: "lib/assets/canta.jpg",
              title: "Çanta",
              location: "İstanbul/Pendik",
              type: "#teklif",
              description:
                  "2. el gömlek. İhtiyacı olan mesaj atabilir. Kargo ücreti benden. Az giyilmiş, temizdir.",
            ),
            StreamCard(
              id: 2,
              imageURL: "lib/assets/ceket.png",
              title: "Ceket",
              location: "Düzce Üniversitesi",
              type: "#talep",
              description:
                  "2. el gömlek. İhtiyacı olan mesaj atabilir. Kargo ücreti benden. Az giyilmiş, temizdir.",
            ),
            StreamCard(
              id: 3,
              imageURL: "lib/assets/masa.jpg",
              title: "Masa",
              location: "Düzce Üniversitesi",
              type: "#talep",
              description:
                  "2. el gömlek. İhtiyacı olan mesaj atabilir. Kargo ücreti benden. Az giyilmiş, temizdir.",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddingAd()),
          );
        },
        child: const Icon(
          Icons.add,
          size: 32.0,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class StreamCard extends StatelessWidget {
  const StreamCard({
    Key key,
    this.id,
    this.imageURL,
    this.title,
    this.location,
    this.type,
    this.description,
  }) : super(key: key);

  final int id;
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
                builder: (context) => AdDetail(
                    id: id,
                    imageURL: imageURL,
                    title: title,
                    location: location,
                    type: type,
                    description: description)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageURL,
              // width: double.infinity,
              // fit: BoxFit.contain,
              height: 250.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 14.0, bottom: 7.0),
              child: Text(
                title.length > 13 ? title.substring(0, 12) + "..." : title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    location.length > 15
                        ? location.substring(0, 14) + "..."
                        : location,
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Text(type,
                    style: TextStyle(
                      fontSize: 16,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
