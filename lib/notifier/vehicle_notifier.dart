import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:greenz_go_app_v2/model/vehicle.dart';

class VehicleNotifier with ChangeNotifier {
  List<Vehicle> _vehicleList = [];
  Vehicle _currentVehicle;

  UnmodifiableListView<Vehicle> get vehicleList =>
      UnmodifiableListView(_vehicleList);
  Vehicle get currentVehicle => _currentVehicle;

  set vehicleList(List<Vehicle> vehicleList) {
    _vehicleList = vehicleList;
    notifyListeners();
  }

  set currentVehicle(Vehicle currentVehicle) {
    _currentVehicle = currentVehicle;
    notifyListeners();
  }
}
