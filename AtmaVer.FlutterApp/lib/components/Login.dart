import 'package:atmaver_real/Layout/StreamLayout.dart';
import 'package:atmaver_real/api/api_service.dart';
import 'package:atmaver_real/model/login_model.dart';
import 'package:atmaver_real/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginRequestModel loginRequestModel;
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/intro.png",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  height: 45.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => loginRequestModel.email = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24.0, top: 24.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => loginRequestModel.password = input,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      print(loginRequestModel.toJson());
                      LoginService loginService = new LoginService();
                      loginService.login(loginRequestModel).then((value) {
                        if (value != null) {
                          if (value.token.isNotEmpty) {
                            print("token:" + value.token);
                            checkLogin(value.token);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Layout()),
                            );
                          } else {
                            print("başarısız");
                          }
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future checkLogin(String token) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  JwtDecoder jwtDecoder = new JwtDecoder();
  String username = jwtDecoder.decode(token)["sub"];

  preferences.setString('token', token);
  preferences.setString('username', username);
  print("Username aha budur:" + preferences.getString('username'));
}
