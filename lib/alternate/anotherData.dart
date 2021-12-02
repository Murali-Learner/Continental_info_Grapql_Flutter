// To parse this JSON data, do
//
//     final countryData = countryDataFromJson(jsonString);

import 'dart:convert';

CountryData2 countryData2FromJson(String str) =>
    CountryData2.fromJson(json.decode(str));

String countryData2ToJson(CountryData2 data) => json.encode(data.toJson());

class CountryData2 {
  CountryData2({
    this.country,
  });

  Country country;

  factory CountryData2.fromJson(Map<String, dynamic> json) => CountryData2(
        country: Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country.toJson(),
      };
}

class Country {
  Country({
    this.code,
    this.name,
    this.phone,
    this.capital,
    this.continent,
    this.states,
    this.currency,
    this.languages,
  });

  String code;
  String name;
  String phone;
  String capital;
  Continent continent;
  List<Continent> states;
  String currency;
  List<Language> languages;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        phone: json["phone"],
        capital: json["capital"],
        continent: Continent.fromJson(json["continent"]),
        states: List<Continent>.from(
            json["states"].map((x) => Continent.fromJson(x))),
        currency: json["currency"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "phone": phone,
        "capital": capital,
        "continent": continent.toJson(),
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
        "currency": currency,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
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

class Language {
  Language({
    this.name,
  });

  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
