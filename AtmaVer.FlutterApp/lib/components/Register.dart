import 'package:atmaver_real/api/api_service.dart';
import 'package:atmaver_real/model/user_model.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterRequestModel registerModel;
  @override
  void initState() {
    super.initState();
    registerModel = new RegisterRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Üye Ol"),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/intro.png",
                  width: MediaQuery.of(context).size.width * 0.37,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.firstName = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ad',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.lastName = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Soyad',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18.0, top: 18.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.userName = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.email = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18.0, top: 18.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.phoneNumber = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefon Numarası',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.password = input,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.passwordConfirm = input,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre Tekrar',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18.0, top: 18.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.gender = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cinsiyet',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18.0, top: 18.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (input) => registerModel.birthDate = input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Doğum Tarihi',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Üye Ol',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      print(registerModel.toJson());
                      RegisterService apiService = new RegisterService();
                      apiService.register(registerModel).then((value) {
                        if (value != null) {
                          if (value.userName.isNotEmpty) {
                            print("Kayıt başarılı: " + value.userName);
                            // checkLogin(value.token);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Layout()),
                            // );
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
          ],
        ),
      ),
    );
  }
}
