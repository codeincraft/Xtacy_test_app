import 'dart:convert';

VerifyPasswordReset verifyEmailModelFromJson(String str) => VerifyPasswordReset.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyPasswordReset data) => json.encode(data.toJson());

class VerifyPasswordReset {
    String email;
    String otp;

    VerifyPasswordReset({
        required this.otp,
        required this.email,
    });

    factory VerifyPasswordReset.fromJson(Map<String, dynamic> json) => VerifyPasswordReset(
        email: json["email"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
    };
}