import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:help/src/services/geolocator_service.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorServices = GeolocatorService();

  //Variables
  Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorServices.getCurrentLocation();
    notifyListeners();
  }
}