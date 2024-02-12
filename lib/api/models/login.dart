import 'dart:convert';

LoginUser loginFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
    String email;
    String password;
    String fcm_token;

    LoginUser({
        required this.email,
        required this.password,
        required this.fcm_token
    });

    factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        email: json["email"],
        password: json["password"], 
        fcm_token: json["fcm_token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "fcm_token": fcm_token,
    };
}