import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {
  String vehicleId;
  String vehicleMake;
  String vehicleModel;
  String vehicleType;
  String rentalAddress;
  String rentalParish;
  int vehicleRate;
  String vehicleDesc;
  String driveType;
  int rating;
  int vehicleSeats;
  String vehicleOwner;
  bool vehicleStatus;

  Timestamp createdAt;

  Vehicle.fromMap(Map<String, dynamic> data) {
    vehicleId = data['vehicleID'];
    vehicleMake = data['vehicleMake'];
    vehicleModel = data['vehicleModel'];
    vehicleType = data['vehicleType'];
    rentalAddress = data['address'];
    rentalParish = data['parish'];
    vehicleRate = data['vehicleRate'];
    vehicleDesc = data['vehicleDescription'];
    driveType = data['driveType'];
    rating = data['rating'];
    vehicleSeats = data['vehicleSeats'];
    vehicleOwner = data['vehicleOwner'];
    vehicleStatus = data['vehicleStatus'];
  }
}
