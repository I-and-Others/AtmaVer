import 'package:jwt_decode/jwt_decode.dart';

class RoleResponseModel {
  final int id;
  final String name;

  RoleResponseModel({this.id, this.name});

  factory RoleResponseModel.fromJson(Map<String, dynamic> json) {
    return RoleResponseModel(
      id: json["id"] != null ? json["id"] : "",
      name: json["name"] != null ? json["name"] : "",
    );
  }
}

class RoleRequestModel {
  String token;

  RoleRequestModel({this.token});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'token': token.trim(),
    };

    return map;
  }
}

class JwtDecoder {
  Map<String, dynamic> decode(String token) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);

    return payload;
  }
}
