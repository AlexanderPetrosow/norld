import 'dart:convert';

StatusCheck statusCheckFromJson(String str) =>
    StatusCheck.fromJson(json.decode(str));

String statusCheckToJson(StatusCheck data) => json.encode(data.toJson());

class StatusCheck {
  bool status;
  List<dynamic> body;

  StatusCheck({
    required this.status,
    required this.body,
  });

  factory StatusCheck.fromJson(Map<String, dynamic> json) => StatusCheck(
        status: json["status"],
        body: List<dynamic>.from(json["body"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x)),
      };
}
