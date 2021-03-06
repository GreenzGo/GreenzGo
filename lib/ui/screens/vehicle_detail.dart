import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';
import 'package:greenz_go_app_v2/ui/screens/vehicle_form.dart';
import 'package:provider/provider.dart';
import 'package:greenz_go_app_v2/constants.dart';

//TODO:#8.1 Clean up code and optimize
//TODO:#8.2 Improve design
//TODO:#8.3 Make responsive for different devices

class VehicleDetail extends StatelessWidget {
  static const String id = 'vehicleProfile_screen';

  //creates vehicle display widget; shows the vehicle image, drive type, seats, rating, location data
  Widget vehicleDisplay(String rating, driveType, seats, location, image) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              border: Border.all(
                width: 5,
                color: const Color(0xff57ba98),
              ),
            ),
            height: 290,
            child: SizedBox.expand(
              child: image != null
                  ? CachedNetworkImage(
                      imageUrl: '$image',
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : Icon(Icons.image_not_supported_rounded),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: const Color(0xff57ba98),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.stars_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Rating",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$rating",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Drive",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$driveType",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_seat_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Seats",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$seats",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$location",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //creates vehicle detail widget; shows the vehicle status, description and status data
  Widget vehicleDetail(
      String vehicleOwner, vehicleType, vehicleDescript, vehicleStatus) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
        color: Color(0xff2a2a2a),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Container(
            width: 370,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Owner:',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$vehicleOwner",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Type:',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$vehicleType",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Text(
              '$vehicleDescript',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ), //show the vehicle description
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Status:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$vehicleStatus",
                        style: TextStyle(
                            color: vehicleStatus == 'Available' ||
                                    vehicleStatus == 'Pending'
                                ? Color(0xff57ba98)
                                : Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //Shows the status of the vehicle
        ],
      ),
    );
  }

  //creates vehicle price detail widget; shows the rental cost data
  Widget priceDetail(String price) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Price:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '\$ $price /day',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  //creates request button; allows user to request the current viewed vehicle
  Widget requestButton() {
    return SizedBox(
        width: 370,
        height: 60,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Request'.toUpperCase()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    VehicleNotifier vehicleNotifier = Provider.of<VehicleNotifier>(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_image_2.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              '${vehicleNotifier.currentVehicle.vehicleMake} ${vehicleNotifier.currentVehicle.vehicleModel}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: kTextColor,
              ),
            ), //displays the name of the vehicle
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border_rounded),
                onPressed: () {},
              ), //allows user the favorite the current vehicle
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return VehicleForm(
                      isUpdating: true,
                    );
                  }));
                },
              ), //allows user to edit the current vehicle data
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  vehicleDisplay(
                    '${vehicleNotifier.currentVehicle.rating}',
                    '${vehicleNotifier.currentVehicle.driveType}',
                    '${vehicleNotifier.currentVehicle.vehicleSeats}',
                    '${vehicleNotifier.currentVehicle.rentalAddress}',
                    '${vehicleNotifier.currentVehicle.image}',
                  ),
                  vehicleDetail(
                    '${vehicleNotifier.currentVehicle.vehicleOwner}',
                    '${vehicleNotifier.currentVehicle.vehicleType}',
                    '${vehicleNotifier.currentVehicle.vehicleDesc}',
                    '${vehicleNotifier.currentVehicle.vehicleStatus}',
                  ),
                  priceDetail('${vehicleNotifier.currentVehicle.vehicleRate}'),
                  requestButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
