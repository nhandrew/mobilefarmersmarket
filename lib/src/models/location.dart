import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Location {
  final String name;
  final String address;
  final String city;
  final String state;
  final GeoPoint geo;
  final String placesId;

  Location({
    @required this.name,
    @required this.address,
    @required this.city,
    @required this.state,
    this.geo,
    this.placesId
  });

  Location.fromFirestore(Map<String,dynamic> firestore)
      : name = firestore['name'],
        address = firestore['address'],
        city = firestore['city'],
        state = firestore['state'],
        geo = firestore['geo'] ?? null,
        placesId = firestore['placesId'] ?? null;


}