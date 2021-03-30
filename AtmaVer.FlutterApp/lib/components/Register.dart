import 'dart:ffi';
import 'dart:io';

import 'package:atmaver_real/Layout/StreamLayout.dart';
import 'package:atmaver_real/api/api_service.dart';
import 'package:atmaver_real/model/login_model.dart';
import 'package:atmaver_real/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  margin: EdgeInsets.only(bottom: 18.0, top: 18.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    child: Text("Profil Fotoğrafı Seç"),
                    onPressed: () async {
                      File _image;
                      Future getImage() async {
                        final pickedFile = await ImagePicker.pickImage(
                            source: ImageSource.gallery);

                        setState(() {
                          if (pickedFile != null) {
                            _image = File(pickedFile.path);
                          } else {
                            print('No image selected.');
                          }
                        });
                      }

                      await getImage();
                      imageUpload(_image);
                    },
                  ),
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
                            checkLogin(
                                registerModel.email, registerModel.password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Layout()),
                            );
                          } else {
                            print("kayıt başarısız");
                          }
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future imageUpload(File image) async {
  UploadImage apiService = new UploadImage();
  apiService.upload(image).then((value) {
    if (value != null) {
      if (value) {
        print("Profil Fotoğrafı başarıyla yüklendi!");
      } else {
        print("başarısız");
      }
    }
  });
}

checkLogin(String email, String password) async {
  try {
    LoginRequestModel requestModel =
        new LoginRequestModel(email: email, password: password);
    LoginService loginService = new LoginService();
    loginService.login(requestModel).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      JwtDecoder jwtDecoder = new JwtDecoder();
      print("bu tokendır" + value.token);
      String username = jwtDecoder.decode(value.token)["sub"];
      print("bu usernamedir" + username);

      preferences.setString('token', value.token);
      preferences.setString('username', username);
      print("Username aha budur:" + preferences.getString('username'));
    });
  } catch (e) {
    print(e);
  }
}
