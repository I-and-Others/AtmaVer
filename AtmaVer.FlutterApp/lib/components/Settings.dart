import 'package:atmaver_real/components/intro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _userName;
  @override
  Widget build(BuildContext context) {
    Future logOut() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.remove('token');
      preferences.remove('username');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    }

    Future getUserName() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var username = preferences.getString('username');
      setState(() {
        _userName = username;
      });
    }

    getUserName();
    return Scaffold(
        body: ListView(children: [
      Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Container(
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.91,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    "https://i.hizliresim.com/3pDKIs.jpg",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                )),
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      _userName != null ? _userName : "text",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
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
      Container(
        child: TextButton(
            child: Text(
              'Log Out!',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              logOut();
            }),
      )
    ]));
  }
}
