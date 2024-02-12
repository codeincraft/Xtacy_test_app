
import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    String first_name;
    String last_name;
    String email;
    String phone;
    String password;

    Register({
        required this.first_name,
        required this.last_name,
        required this.email,
        required this.phone,
        required this.password,
    });

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        first_name: json["first_name"],
        last_name: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "phone": phone,
        "password": password,
    };
}