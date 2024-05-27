import 'dart:convert';

List<MapPolygons> mapPolygonsFromJson(String str) => List<MapPolygons>.from(
    json.decode(str).map((x) => MapPolygons.fromJson(x)));

String mapPolygonsToJson(List<MapPolygons> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapPolygons {
  String? id;
  List<List<double>>? coordinates;
  List<double>? center;
  String? title;

  MapPolygons({
    this.id,
    this.coordinates,
    this.center,
    this.title,
  });

  factory MapPolygons.fromJson(Map<String, dynamic> json) => MapPolygons(
        id: json["id"],
        coordinates: json["coordinates"] == null
            ? []
            : List<List<double>>.from(json["coordinates"]!
                .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        center: json["center"] == null
            ? []
            : List<double>.from(json["center"]!.map((x) => x?.toDouble())),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(
                coordinates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "center":
            center == null ? [] : List<dynamic>.from(center!.map((x) => x)),
        "title": title,
      };
}
