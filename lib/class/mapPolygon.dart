import 'dart:convert';

MapPolygon mapPolygonFromJson(String str) =>
    MapPolygon.fromJson(json.decode(str));

String mapPolygonToJson(MapPolygon data) => json.encode(data.toJson());

class MapPolygon {
  bool? status;
  List<Body>? body;

  MapPolygon({
    this.status,
    this.body,
  });

  factory MapPolygon.fromJson(Map<String, dynamic> json) => MapPolygon(
        status: json["status"],
        body: json["body"] == null
            ? []
            : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": body == null
            ? []
            : List<dynamic>.from(body!.map((x) => x.toJson())),
      };
}

class Body {
  String? id;
  Center? center;
  List<List<double>>? coordinates;
  bool? sale;
  String? ico;

  Body({
    this.id,
    this.center,
    this.coordinates,
    this.sale,
    this.ico,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        center: json["center"] == null ? null : Center.fromJson(json["center"]),
        coordinates: json["coordinates"] == null
            ? []
            : List<List<double>>.from(json["coordinates"]!
                .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        sale: json["sale"],
        ico: json["ico"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "center": center?.toJson(),
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(
                coordinates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "sale": sale,
        "ico": ico,
      };
}

class Center {
  double? lng;
  double? lat;

  Center({
    this.lng,
    this.lat,
  });

  factory Center.fromJson(Map<String, dynamic> json) => Center(
        lng: json["lng"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lng": lng,
        "lat": lat,
      };
}
