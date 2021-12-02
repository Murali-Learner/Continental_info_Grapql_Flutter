// To parse this JSON data, do
//
//     final continentData = continentDataFromJson(jsonString);

import 'dart:convert';

ContinentData continentDataFromJson(String str) =>
    ContinentData.fromJson(json.decode(str));

String continentDataToJson(ContinentData data) => json.encode(data.toJson());

class ContinentData {
  ContinentData({
    this.continents,
  });

  List<Continent> continents;

  factory ContinentData.fromJson(Map<String, dynamic> json) => ContinentData(
        continents: List<Continent>.from(
            json["continents"].map((x) => Continent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "continents": List<dynamic>.from(continents.map((x) => x.toJson())),
      };
}

class Continent {
  Continent({
    this.code,
    this.name,
  });

  String code;
  String name;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
