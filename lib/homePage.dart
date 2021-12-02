import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_eg/alternate/anotherData.dart';

import 'package:graphql_eg/methods/totalMethods.dart';

import 'package:simple_gql/simple_gql.dart';

class HomePage extends StatefulWidget {
  String countryCode;
  String countryName;

  HomePage({this.countryCode, this.countryName});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String countryCode = "IN";

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          widget.countryName,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: FutureBuilder<CountryData2>(
            future: TotalMethods.getData(widget.countryCode),
            builder: (BuildContext context, var snapshot) {
              return snapshot.hasData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(30),
                          elevation: 10,
                          child: Container(
                            height: _height * 0.27,
                            width: _width,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data.country.name,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 30),
                                ),
                                Text(
                                  snapshot.data.country.code,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 25),
                                ),
                                Text(
                                  snapshot.data.country.phone,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  snapshot.data.country.capital,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  snapshot.data.country.languages.first.name,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  snapshot.data.country.currency,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SizedBox(
                                  height: _height * 0.03,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.03,
                        ),
                        stateData(_height, _width, snapshot)
                      ],
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

  Widget stateData(
      double _height, double _width, AsyncSnapshot<CountryData2> snapshot) {
    return Material(
      type: MaterialType.card,
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      child: Container(
        height: _height * 0.5,
        width: _width,
        child: ListView.builder(
          itemCount: snapshot.data.country.states.length,
          itemBuilder: (context, index) {
            print(snapshot.data.country.code);
            return snapshot.hasData
                ? ListTile(
                    title: Text(
                      snapshot.data.country.states[index].name,
                      style:
                          GoogleFonts.lato(color: Colors.black, fontSize: 20),
                    ),
                    trailing: Text(
                      snapshot.data.country.states[index].code,
                      style:
                          GoogleFonts.lato(color: Colors.black, fontSize: 20),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
