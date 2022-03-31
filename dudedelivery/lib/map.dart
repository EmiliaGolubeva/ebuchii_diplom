import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'constants.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(60.044207, 30.345195),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF161615),
        title: Text(
          'Карты',
          style: kMainHeading.copyWith(
              color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Column(
        children: [
          Row( children: [
            Expanded(child: TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'Search'),
              onChanged: (value){
                print(value);
              },
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.search),),
          ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
            ),
          ),
        ],
      ),

    );
  }

}