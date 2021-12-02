// To parse this JSON data, do
//
//     final continentDataCode = continentDataCodeFromJson(jsonString);

import 'dart:convert';

ContinentDataCode continentDataCodeFromJson(String str) =>
    ContinentDataCode.fromJson(json.decode(str));

String continentDataCodeToJson(ContinentDataCode data) =>
    json.encode(data.toJson());

class ContinentDataCode {
  ContinentDataCode({
    this.continent,
  });

  Continent continent;

  factory ContinentDataCode.fromJson(Map<String, dynamic> json) =>
      ContinentDataCode(
        continent: Continent.fromJson(json["continent"]),
      );

  Map<String, dynamic> toJson() => {
        "continent": continent.toJson(),
      };
}

class Continent {
  Continent({
    this.name,
    this.code,
    this.countries,
  });

  String name;
  String code;
  List<Country> countries;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        name: json["name"],
        code: json["code"],
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.code,
    this.name,
  });

  String code;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
