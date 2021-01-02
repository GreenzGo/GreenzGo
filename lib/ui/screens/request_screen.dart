import 'package:flutter/material.dart';

//TODO: #7Change the subjects and information from a column of rows to a column of two containers that have 1 column each so that it could be aligned better.

const double space = 2.8;

class RequestScreen extends StatelessWidget {
  static const String id = 'request_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF212121),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Requests",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                        color: Color(0xff57ba98),
                      ),
                    ),
                    Text(
                      "4 Items found",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xffb5cfd2),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3f3f3f),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.00),
                          bottomLeft: Radius.circular(15.00),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          overflow: Overflow.visible,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Requester:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Frankie Blizzard",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Vehicle:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text(
                                        "Honda CR-V",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Location:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Belmont, St George",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Date:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 42,
                                      ),
                                      Text(
                                        "12/21/2020 - 12/27/2020",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: -7,
                              child: Container(
                                height: 100.00,
                                width: 100.00,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/Logo.png'),
                                    scale: 10,
                                  ),
                                  color: Color(0xffe5cd00),
                                  border: Border.all(
                                    width: 8.00,
                                    color: Color(0xfff2f2f2),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3f3f3f),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.00),
                          bottomLeft: Radius.circular(15.00),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          overflow: Overflow.visible,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Requester:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Frankie Blizzard",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Vehicle:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text(
                                        "Honda CR-V",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Location:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Belmont, St George",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Date:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 42,
                                      ),
                                      Text(
                                        "12/21/2020 - 12/27/2020",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: -7,
                              child: Container(
                                height: 100.00,
                                width: 100.00,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/Logo.png'),
                                    scale: 10,
                                  ),
                                  color: Colors.red,
                                  border: Border.all(
                                    width: 8.00,
                                    color: Color(0xfff2f2f2),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3f3f3f),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.00),
                          bottomLeft: Radius.circular(15.00),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          overflow: Overflow.visible,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Requester:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Frankie Blizzard",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Vehicle:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text(
                                        "Honda CR-V",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Location:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Belmont, St George",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Date:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 42,
                                      ),
                                      Text(
                                        "12/21/2020 - 12/27/2020",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: -7,
                              child: Container(
                                height: 100.00,
                                width: 100.00,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/Logo.png'),
                                    scale: 10,
                                  ),
                                  color: Colors.green,
                                  border: Border.all(
                                    width: 8.00,
                                    color: Color(0xfff2f2f2),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3f3f3f),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.00),
                          bottomLeft: Radius.circular(15.00),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          overflow: Overflow.visible,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Requester:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Frankie Blizzard",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Vehicle:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text(
                                        "Honda CR-V",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Location:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Belmont, St George",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(space),
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: [
                                      Text(
                                        "Date:",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(0xff57ba98),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 42,
                                      ),
                                      Text(
                                        "12/21/2020 - 12/27/2020",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xfff2f2f2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: -7,
                              child: Container(
                                height: 100.00,
                                width: 100.00,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/Logo.png'),
                                    scale: 10,
                                  ),
                                  color: Colors.grey[800],
                                  border: Border.all(
                                    width: 8.00,
                                    color: Color(0xfff2f2f2),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
