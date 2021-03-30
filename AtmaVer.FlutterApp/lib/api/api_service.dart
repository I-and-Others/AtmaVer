import 'dart:io';

import 'package:atmaver_real/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/role_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://atmaver.somee.com/api/Login/Login";

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestModel.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class RoleService {
  Future<List<RoleResponseModel>> role(String token) async {
    String url = "http://atmaver.somee.com/api/Roles/GetAllRoles";

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Authorization": "Bearer " + token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((role) => new RoleResponseModel.fromJson(role))
          .toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class RegisterService {
  Future<RegisterResponseModel> register(
      RegisterRequestModel requestModel) async {
    String url = "http://atmaver.somee.com/api/Login/CreateUser";

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestModel.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class UploadImage {
  Future<bool> upload(File pickedImage) async {
    Dio dio = new Dio();
    String url = "https://localhost:5001/api/Images/CreateUserImage";

    // try {
    //   String fileName = pickedImage.path.split('/').last;
    //   FormData formData = new FormData.fromMap({
    //     "userId": 2,
    //     "file": await http.MultipartFile.fromPath(pickedImage.path, "")
    //   });
    //    await dio.post(url,
    //   data: formData,
    //   options: Options(headers: {
    //     "accept": "*/*",
    //     "Authorization": "Bearer accesstoken",
    //     "Content-Type": "multipart/form-data"
    //   }));

    //   print("response");
    // } catch (e) {
    //   return null;
    // }
    FormData formData = new FormData.fromMap({
      "userId": 2,
      "file": await http.MultipartFile.fromPath(pickedImage.path, "")
    });

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(formData),
      headers: <String, String>{
        "accept": "*/*",
        "Authorization": "Bearer accesstoken",
        "Content-Type": "multipart/form-data"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
