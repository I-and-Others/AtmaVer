import 'package:atmaver_demo/AdvertisementDetail.dart';
import 'package:atmaver_demo/Layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Welcome(),
        '/main': (context) => Layout(),
        // '/addetail': (context) => AdvertisementDetail(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.redAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  FlutterLogo(
                    size: 100.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "AtmaVer",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0, top: 40.0),
                    width: 150.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: Color.fromARGB(255, 34, 40, 49),
                      elevation: 10,
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/main');
                      },
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: Color.fromARGB(255, 34, 40, 49),
                      elevation: 10,
                      child: Text(
                        "Kayıt ol",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        print("Butona 1 Kez Tıklandı");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
