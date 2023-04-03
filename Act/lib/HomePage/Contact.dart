import 'dart:convert';
import 'package:act/HomePage/AdmissionPage.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'NavBarButton.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_maps_flutter/google_maps_flutter.dart';


double collapsableHeight = 0.0;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();


}

class _ContactState extends State<Contact> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    Size ss = MediaQuery
        .of(context)
        .size;

    return Column(
        children: [

          Container(
            alignment: Alignment.topCenter,
            child: const AutoSizeText(

              "Contact us",
              minFontSize: 40,
              maxFontSize: 70,
              style: TextStyle(fontSize: 70),
              maxLines: 1,
            ),
          ),


            SizedBox(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (width < 850) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 300),
                        child: Column(
                          children: [
                            Container(
                              width: screenSize.width - 75,
                              height: screenSize.height - 450,
                              alignment: Alignment.topCenter,
                              child: MapScreen(),
                            ),
                            Container(
                              width:screenSize.width,
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(top: 100),
                              child: const AutoSizeText(
                                "Address:\n"
                                    "Active Institute of Fashion Technology\n"
                                    "B3, Gomathy Star city, Noothencheri, Madambakkam \n"
                                    "Chennai, Tamil Nadu 600126\n",

                                minFontSize: 20,
                                maxFontSize: 50,
                                style: TextStyle(fontSize: 30),
                                maxLines: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      child: Row(
                        children: [
                          Container(
                            width: screenSize.width / 2,
                            height: screenSize.height - 350,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 30),
                            child: MapScreen(),
                          ),
                           Container(
                             width: 700,
                            padding: EdgeInsets.only(left: 20),
                            child: const AutoSizeText(

                              "Address:\n"
                                  "Active Institute of Fashion Technology\n"
                                  "B3,Gomathy Star city,Noothencheri,Madambakkam\n"
                                  "Chennai, Tamil Nadu 600126\n",
                              minFontSize: 5,
                              maxFontSize: 40,
                              style: TextStyle(fontSize: 40),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),


        ],
    );
  }
}

  class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _center = const LatLng(12.898744, 80.163609);
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: {
          Marker(
            markerId: MarkerId('AIFT'),
            position: _center,
            infoWindow: InfoWindow(
                title: 'Active Institute of fashion technology',
                snippet:
                    'Watch on google maps: <a href="https://goo.gl/maps/qUE87PpY5Tr1n9AR7">https://www.googlemaps.com</a>'),
          ),
        },
      ),
    );
  }
}

