import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenz_go_app_v2/model/user.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

uploadVehicleWithImage(Vehicle vehicle, bool isUpdating, File localFile) async {
  if (localFile != null) {
    print('uploading image');
    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('/images/$uuid$fileExtension');

    await firebaseStorageRef.putFile(localFile).catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print('downloaded url: $url');
    _uploadVehicle(vehicle, isUpdating, imageUrl: url);
  } else {
    print('skipping image upload');
    _uploadVehicle(vehicle, isUpdating);
  }
}

_uploadVehicle(Vehicle vehicle, bool isUpdating, {String imageUrl}) async {
  CollectionReference vehicleRef =
      FirebaseFirestore.instance.collection('Vehicles');
  User firebaseUser = await FirebaseAuth.instance.currentUser;

  if (imageUrl != null) {
    vehicle.image = imageUrl;
  }

  if (isUpdating) {
    vehicle.updatedAt = Timestamp.now();
    await vehicleRef.doc(vehicle.vehicleId).update(vehicle.toMap());
    print('updated vehicle with id: ${vehicle.vehicleId}');
  } else {
    vehicle.createdAt = Timestamp.now();
    DocumentReference documentReference = await vehicleRef.add(vehicle.toMap());

    vehicle.vehicleOwner = firebaseUser.displayName;

    vehicle.vehicleId = documentReference.id;
    vehicle.vehicleStatus = 'Available';
    vehicle.rating = 0;

    print('uploaded vehicle successfully: ${vehicle.toString()}');

    await documentReference.set(vehicle.toMap(), SetOptions(merge: true));
  }
}
