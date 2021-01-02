import 'package:flutter/material.dart';

class RenterProfileScreen extends StatelessWidget {
  static const String id = 'renterProfile_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF212121),
        body: Column(
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
                "John Doe",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Color(0xff57ba98),
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
                      "jdoe@gmail.com",
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
                          color: Color(0xff57ba98),
                        ),
                      ),
                      Text(
                        "Rented",
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
                        "1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xff57ba98),
                        ),
                      ),
                      Text(
                        "Active",
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
                        "3",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xff57ba98),
                        ),
                      ),
                      Text(
                        "Pending",
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
                          color: Color(0xff57ba98),
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
                                color: Color(0xff57ba98),
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
                                color: Color(0xff57ba98),
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
                                color: Color(0xff57ba98),
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
                              Icons.exit_to_app,
                              color: Color(0xff57ba98),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xff57ba98),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
