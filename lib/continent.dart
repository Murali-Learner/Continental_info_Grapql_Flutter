import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_eg/codeContinent.dart';
import 'package:graphql_eg/methods/continentData.dart';
import 'package:graphql_eg/methods/totalMethods.dart';

class ContinentPage extends StatefulWidget {
  @override
  _ContinentPageState createState() => _ContinentPageState();
}

class _ContinentPageState extends State<ContinentPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Continent Information"),
      ),
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: FutureBuilder<ContinentData>(
            future: TotalMethods.continentData(),
            builder: (BuildContext context, var snapshot) {
              return snapshot.hasData && snapshot.data.continents != null
                  ? Container(
                      height: _height * 0.8,
                      width: _width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView.builder(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: snapshot.data.continents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data.continents != null
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return CodeContinent(
                                            continentCode: snapshot
                                                .data.continents[index].code,
                                            continentName: snapshot
                                                .data.continents[index].name,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: _height * 0.007,
                                      ),
                                      Material(
                                        elevation: 10,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: _height * 0.23,
                                          width: _width,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data.continents[index]
                                                    .name,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data.continents[index]
                                                    .code,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.007,
                                      ),
                                    ],
                                  ),
                                )
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
