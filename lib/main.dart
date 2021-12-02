import 'package:flutter/material.dart';
import 'package:graphql_eg/alternate/anotherData.dart';
import 'package:graphql_eg/continent.dart';
import 'package:graphql_eg/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: ContinentPage(),
    );
  }
}
