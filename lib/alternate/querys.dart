import 'package:graphql_eg/alternate/anotherClient.dart';
import 'package:graphql_eg/gqlClient.dart';
import 'package:graphql_eg/graphQuery.dart';

import 'package:simple_gql/simple_gql.dart';

Future<GQLResponse> countryResponse2(String code) async {
  final String country2 = ''' 
  query country{
    country(code:"$code"){
    code
    name
    phone
    capital
    continent{
      code
      name
    }
    states{
      code
      
      name
    }
    currency
    languages{
      name
    }
 
  }
  }
  
  
  ''';
  GQLResponse countryResponse = await client2.query(query: country2);

  return countryResponse;
}

Future<GQLResponse> continentResponse() async {
  final String continent = '''
  query continent{
     continents{
    code
    name   
  }
  } ''';
  GQLResponse continentResponse = await client2.query(query: continent);
  print("....${continentResponse.data}");
  return continentResponse;
}

Future<GQLResponse> continentCode(continentcode) async {
  final String continentcodequery = '''
  query continentcode{
   continent(code:"$continentcode"){
  name
  code
  countries{
    code
    name
    
  }
}
  } ''';
  GQLResponse continentCodeResponse =
      await client2.query(query: continentcodequery);
  print(";;;;..${continentCodeResponse.data}");
  return continentCodeResponse;
}
