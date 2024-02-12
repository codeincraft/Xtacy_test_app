import 'dart:convert';

ResetPasswordEmail verifyEmailModelFromJson(String str) => ResetPasswordEmail.fromJson(json.decode(str));

String verifyEmailModelToJson(ResetPasswordEmail data) => json.encode(data.toJson());

class ResetPasswordEmail {
    String email;
    // String token;

    ResetPasswordEmail({
        required this.email,
        // required this.token,
    });

    factory ResetPasswordEmail.fromJson(Map<String, dynamic> json) => ResetPasswordEmail(
        email: json["email"],
        // token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        // "token": token,
    };
}