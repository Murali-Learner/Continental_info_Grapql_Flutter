// To parse this JSON data, do
//
//     final countryData = countryDataFromJson(jsonString);

import 'dart:convert';

CountryData countryDataFromJson(String str) =>
    CountryData.fromJson(json.decode(str));

String countryDataToJson(CountryData data) => json.encode(data.toJson());

class CountryData {
  CountryData({
    this.country,
  });

  Country country;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
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
    this.currency,
    this.languages,
  });

  String code;
  String name;
  String phone;
  String capital;
  String currency;
  List<Language> languages;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        phone: json["phone"],
        capital: json["capital"],
        currency: json["currency"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "phone": phone,
        "capital": capital,
        "currency": currency,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
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
