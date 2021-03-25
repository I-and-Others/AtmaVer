import 'package:atmaver_real/components/Login.dart';
import 'package:atmaver_real/components/Register.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 450.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "lib/assets/intro.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Column(
              children: [
                Container(
                  width: 175.0,
                  height: 50.0,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                  ),
                ),
                Container(
                  width: 175.0,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Üye Ol',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
