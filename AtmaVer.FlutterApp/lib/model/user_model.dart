import 'package:jwt_decode/jwt_decode.dart';

class RegisterResponseModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String passwordConfirm;
  final String gender;
  final String birthDate;

  RegisterResponseModel(
      {this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.phoneNumber,
      this.password,
      this.passwordConfirm,
      this.gender,
      this.birthDate});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
        firstName: json["firstName"] != null ? json["firstName"] : "",
        lastName: json["lastName"] != null ? json["lastName"] : "",
        userName: json["userName"] != null ? json["userName"] : "",
        email: json["email"] != null ? json["email"] : "",
        phoneNumber: json["phoneNumber"] != null ? json["phoneNumber"] : "",
        password: json["password"] != null ? json["password"] : "",
        passwordConfirm:
        json["passwordConfirm"] != null ? json["passwordConfirm"] : "",
        gender: json["gender"] != null ? json["gender"] : "",
        birthDate: json["birthDate"] != null ? json["birthDate"] : "");
  }
}

class RegisterRequestModel {
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String password;
  String passwordConfirm;
  String gender;
  String birthDate;

  RegisterRequestModel(
      {this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.phoneNumber,
      this.password,
      this.passwordConfirm,
      this.gender,
      this.birthDate});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'firstName': firstName.trim(),
      'lastName': lastName.trim(),
      'userName': userName.trim(),
      'email': email.trim(),
      'phoneNumber': phoneNumber.trim(),
      'password': password.trim(),
      'passwordConfirm': passwordConfirm.trim(),
      'gender': gender.trim(),
      'birthDate': birthDate.trim(),
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
