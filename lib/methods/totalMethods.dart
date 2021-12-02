import 'dart:convert';
import 'package:graphql_eg/alternate/anotherData.dart';
import 'package:graphql_eg/alternate/querys.dart';
import 'package:graphql_eg/methods/continentData.dart';
import 'package:graphql_eg/methods/continentFull.dart';
import 'package:simple_gql/simple_gql.dart';

class TotalMethods {
  static Future<CountryData2> getData(String code1) async {
    try {
      GQLResponse gqlData = await countryResponse2(code1);

      CountryData2 country = countryData2FromJson(json.encode(gqlData.data));
      print(country.country.currency);
      return country;
    } catch (e) {
      print(e);
      return CountryData2();
    }
  }

  static Future<ContinentData> continentData() async {
    try {
      GQLResponse _continentresponse = await continentResponse();
      ContinentData continent =
          continentDataFromJson(json.encode(_continentresponse.data));

      return continent;
    } catch (e) {
      return ContinentData();
    }
  }

  static Future<ContinentDataCode> continentCodedata(code) async {
    try {
      GQLResponse _continentCoderesponse = await continentCode(code);

      ContinentDataCode continentCodeData =
          continentDataCodeFromJson(json.encode(_continentCoderesponse.data));
      print("continentDatacode:${continentCodeData.continent.name}");
      return continentCodeData;
    } catch (e) {
      return ContinentDataCode();
    }
  }
}
