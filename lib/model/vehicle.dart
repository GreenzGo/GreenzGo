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
  String vehicleStatus;
  String image;

  Timestamp createdAt;
  Timestamp updatedAt;

  Vehicle();

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
    image = data['image'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'vehicleID': vehicleId,
      'vehicleMake': vehicleMake,
      'vehicleModel': vehicleModel,
      'vehicleType': vehicleType,
      'address': rentalAddress,
      'parish': rentalParish,
      'vehicleRate': vehicleRate,
      'vehicleDescription': vehicleDesc,
      'driveType': driveType,
      'rating': rating,
      'vehicleSeats': vehicleSeats,
      'vehicleOwner': vehicleOwner,
      'vehicleStatus': vehicleStatus,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
