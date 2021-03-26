import 'package:atmaver_real/model/user_model.dart';

import '../model/role_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
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
      return jsonResponse.map((role) => new RoleResponseModel.fromJson(role)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class RegisterService {
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
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