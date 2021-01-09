import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:greenz_go_app_v2/model/vehicle.dart';

//Creates Vehicle Notifier class
class VehicleNotifier with ChangeNotifier {
  List<Vehicle> _vehicleList = [];
  Vehicle _currentVehicle;

  UnmodifiableListView<Vehicle> get vehicleList =>
      UnmodifiableListView(_vehicleList);
  Vehicle get currentVehicle => _currentVehicle;

//creates a list of vehicles
  set vehicleList(List<Vehicle> vehicleList) {
    _vehicleList = vehicleList;
    notifyListeners();
  }

//assigns currentVehicle information
  set currentVehicle(Vehicle currentVehicle) {
    _currentVehicle = currentVehicle;
    notifyListeners();
  }
}
