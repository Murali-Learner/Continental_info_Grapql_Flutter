import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_eg/homePage.dart';
import 'package:graphql_eg/methods/continentFull.dart';
import 'package:graphql_eg/methods/totalMethods.dart';

// ignore: must_be_immutable
class CodeContinent extends StatefulWidget {
  String continentCode;
  String continentName;
  CodeContinent({this.continentCode, this.continentName});
  @override
  _CodeContinentState createState() => _CodeContinentState();
}

class _CodeContinentState extends State<CodeContinent> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.continentName),
      ),
      body: SafeArea(
          child: Container(
        height: _height,
        width: _width,
        child: FutureBuilder<ContinentDataCode>(
          future: TotalMethods.continentCodedata(widget.continentCode),
          builder: (BuildContext context, var snapshot) {
            return snapshot.hasData && snapshot.data.continent.code != null
                ? Container(
                    height: _height * 0.001,
                    width: _width * 0.3,
                    child: ListView.builder(
                      itemCount: snapshot.data.continent.countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return snapshot.data.continent.code != null
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HomePage(
                                          countryCode: snapshot.data.continent
                                              .countries[index].code,
                                          countryName: snapshot.data.continent
                                              .countries[index].name,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Card(
                                    child: ListTile(
                                  title: Text(
                                    snapshot
                                        .data.continent.countries[index].name,
                                    style: GoogleFonts.laila(fontSize: 20),
                                  ),
                                  trailing: Text(
                                    snapshot
                                        .data.continent.countries[index].code,
                                    style: GoogleFonts.laila(fontSize: 20),
                                  ),
                                )),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      )),
    );
  }
}
