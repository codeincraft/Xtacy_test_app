import 'dart:convert';

ResetPasswordModel verifyEmailModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String verifyEmailModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
    String email;
    String otp;
    String password;

  ResetPasswordModel({
    required this.email,
    required this.otp,
    required this.password,
  });

    factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
        email: json["email"],
        otp: json["otp"], 
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
        "password": password,
    };
}
