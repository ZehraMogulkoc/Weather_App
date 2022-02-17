import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class Location{
  double latitude=100;
  double longitude=200;
  Future<void> getCurrentLocation() async { //wait until this completes before you continue anything
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // if you use Future<Position> position then it will print instance. Because it continue with the other parts of project until this part is done
      longitude=position.longitude;
      latitude=position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}