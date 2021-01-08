import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/ui/screens/vehicle_form.dart';
import 'package:greenz_go_app_v2/api/greenz_go_api.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  void _logout() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    logout(authNotifier);
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    VehicleNotifier vehicleNotifier = Provider.of<VehicleNotifier>(context);

    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF212121),
        body: ListView(
          children: [
            Container(
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 150.00,
                    width: 412.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/cover_image.png'),
                      ),
                      border: Border.all(
                        width: 1.00,
                        color: Color(0xff707070),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -75,
                    left: 138,
                    child: Container(
                      height: 135.00,
                      width: 135.00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/car.jpg'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(
                          width: 1.00,
                          color: Color(0xff707070),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                authNotifier.user != null
                    ? authNotifier.user.displayName
                    : 'John Doe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: kTextColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color(0xff57ba98),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "+1(473)549-0921",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 13,
                        color: Color(0xff707070),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Color(0xff57ba98),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      authNotifier.user != null
                          ? authNotifier.user.email
                          : "jdoe@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 13,
                        color: Color(0xff707070),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 110.00,
                  width: 110.00,
                  color: Color(0xff212121),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "12",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                      Text(
                        "Rentals",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 14,
                          color: Color(0xff707070),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 110.00,
                  width: 110.00,
                  color: Color(0xff212121),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "4.0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                      Text(
                        "Rating",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 14,
                          color: Color(0xff707070),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 110.00,
                  width: 110.00,
                  color: Color(0xff212121),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "\$ 100-250",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                      Text(
                        "Price Range",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 14,
                          color: Color(0xff707070),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Location:",
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Grand Anse, St. George",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 14,
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 5),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pageview,
                              color: Color(0xff57ba98),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "View Requests",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            )
                          ],
                        ),
                        height: 55.00,
                        width: 160.00,
                        decoration: BoxDecoration(
                          color: Color(0xff3f3f3f),
                          borderRadius: BorderRadius.circular(28.00),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 5,
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xff57ba98),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Calendar",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            )
                          ],
                        ),
                        height: 55.00,
                        width: 160.00,
                        decoration: BoxDecoration(
                          color: Color(0xff3f3f3f),
                          borderRadius: BorderRadius.circular(28.00),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 5,
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Color(0xff57ba98),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            )
                          ],
                        ),
                        height: 55.00,
                        width: 160.00,
                        decoration: BoxDecoration(
                          color: Color(0xff3f3f3f),
                          borderRadius: BorderRadius.circular(28.00),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 5,
                      ),
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {
                            _logout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.exit_to_app,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        height: 55.00,
                        width: 160.00,
                        decoration: BoxDecoration(
                          color: Color(0xff3f3f3f),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, bottom: 10),
              child: Text(
                "Vehicle Catalog",
                style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Color(0xff57ba98),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.table_chart,
                    color: Color(0xff57ba98),
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: Color(0xff57ba98),
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.filter_none,
                    color: Color(0xff57ba98),
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    bottom: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      vehicleNotifier.currentVehicle = null;
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return VehicleForm();
                      }));
                    },
                    tooltip: 'Add a new Vehicle',
                    icon: Icon(
                      Icons.add_circle,
                      color: Color(0xff57ba98),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
