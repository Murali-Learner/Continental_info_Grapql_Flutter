import 'package:graphql_eg/gqlClient.dart';

import 'package:simple_gql/simple_gql.dart';

Future<GQLResponse> countryResponse(String countryCode) async {
  final String country = '''
  query userss{
    country(code:"$countryCode"){
    code
    name
    phone
    capital
    currency
    languages{
      name
    }
 
  }
  }
  ''';

  // try {
  GQLResponse response = await client.query(query: country);
  // } catch (error) {
  //   print(error);
  // }
  print("----------------------me");
  // print(response.data);

  return response;
}
