import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
  bool status;
  Body body;

  SignIn({
    required this.status,
    required this.body,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        status: json["status"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": body.toJson(),
      };
}

class Body {
  String code;
  bool enabled;

  Body({
    required this.code,
    required this.enabled,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        code: json["code"],
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "enabled": enabled,
      };
}
