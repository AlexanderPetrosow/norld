import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  bool status;
  Body body;

  UserInfo({
    required this.status,
    required this.body,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        status: json["status"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": body.toJson(),
      };
}

class Body {
  String id;
  String email;
  dynamic inviteId;
  DateTime createdAt;
  String isEnabled;
  String token;
  String rank;
  List<dynamic> balance;
  dynamic balanceResources;

  Body({
    required this.id,
    required this.email,
    required this.inviteId,
    required this.createdAt,
    required this.isEnabled,
    required this.token,
    required this.rank,
    required this.balance,
    required this.balanceResources,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        email: json["email"],
        inviteId: json["invite_id"],
        createdAt: DateTime.parse(json["created_at"]),
        isEnabled: json["is_enabled"],
        token: json["token"],
        rank: json["rank"],
        balance: List<dynamic>.from(json["balance"].map((x) => x)),
        balanceResources: json["balanceResources"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "invite_id": inviteId,
        "created_at": createdAt.toIso8601String(),
        "is_enabled": isEnabled,
        "token": token,
        "rank": rank,
        "balance": List<dynamic>.from(balance.map((x) => x)),
        "balanceResources": balanceResources,
      };
}
