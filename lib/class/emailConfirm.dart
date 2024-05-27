import 'dart:convert';

EmailConfirm emailConfirmFromJson(String str) =>
    EmailConfirm.fromJson(json.decode(str));

String emailConfirmToJson(EmailConfirm data) => json.encode(data.toJson());

class EmailConfirm {
  bool status;
  Body body;

  EmailConfirm({
    required this.status,
    required this.body,
  });

  factory EmailConfirm.fromJson(Map<String, dynamic> json) => EmailConfirm(
        status: json["status"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": body.toJson(),
      };
}

class Body {
  String token;

  Body({
    required this.token,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
