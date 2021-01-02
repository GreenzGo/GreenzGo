import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenz_go_app_v2/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenz_go_app_v2/model/vehicle.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';

final _firestore = FirebaseFirestore.instance;

login(UserAccnt user, AuthNotifier authNotifier) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((e) => print(e.code));

  if (userCredential != null) {
    User firebaseUser = userCredential.user;
    if (firebaseUser != null) {
      print("Login: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

register(UserAccnt user, AuthNotifier authNotifier) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .catchError((e) => print(e.code));

  if (userCredential != null) {
    User firebaseUser = userCredential.user;
    _firestore.collection('app_users').add({
      'accountType': user.accountType,
      'age': user.age,
      'display': user.displayName,
    });

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(displayName: user.displayName);

      await firebaseUser.reload();

      print('Sign Up: $firebaseUser');

      User currentUser = await FirebaseAuth.instance.currentUser;
      authNotifier.setUser(currentUser);
    }
  }
}

logout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance.signOut().catchError((e) => print(e.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  User firebaseUser = await FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    authNotifier.setUser(firebaseUser);
  }
}

getVehicles(VehicleNotifier vehicleNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Vehicles').get();

  List<Vehicle> _vehicleList = [];

  snapshot.docs.forEach((document) {
    Vehicle vehicle = Vehicle.fromMap(document.data());
    _vehicleList.add(vehicle);
  });

  vehicleNotifier.vehicleList = _vehicleList;
}
