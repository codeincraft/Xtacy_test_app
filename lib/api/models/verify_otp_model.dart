import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) => VerifyEmailModel.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyEmailModel data) => json.encode(data.toJson());

class VerifyEmailModel {
    String otp;
    // String token;

    VerifyEmailModel({
        required this.otp,
        // required this.token,
    });

    factory VerifyEmailModel.fromJson(Map<String, dynamic> json) => VerifyEmailModel(
        otp: json["otp"],
        // token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        // "token": token,
    };
}