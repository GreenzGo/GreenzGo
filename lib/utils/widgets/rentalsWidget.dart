// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:greenz_go_app_v2/ui/screens/catalog_screen.dart';
//
// class RentalsWidget extends StatefulWidget {
//   RentalsWidget({Key key}) : super(key: key);
//
//   _RentalsWidgetState createState() => _RentalsWidgetState();
// }
//
// class _RentalsWidgetState extends State<RentalsWidget> {
//   List<CarRentals> carRentals = List();
//
//   Future<List<CarRentals>> fetchServices(http.Client client) async {
//     final response = await http
//         .get('https://my.api.mockaroo.com/rental_vehicles.json?key=2bb79dd0');
//     return parseServices(response.body);
//   }
//
//   List<CarRentals> parseServices(String responseBody) {
//     return (json.decode(responseBody) as List)
//         .map((data) => new CarRentals.fromJSON(data))
//         .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<CarRentals>>(
//       future: fetchServices(http.Client()),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) print(snapshot.error);
//
//         return snapshot.hasData
//             ? (CatalogScreen(carRentals: snapshot.data))
//             : Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
