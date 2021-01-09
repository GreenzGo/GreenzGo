import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/constants.dart';

//TODO:#6.1 Clean up code and optimize
//TODO:#6.2 Use same design format as vehicle form
//TODO:#6.3 Update api with code to allow user account data to be updated

const double spacing = 10;
double sliderValue = 20;

class EditProfileScreen extends StatefulWidget {
  static const String id = 'editProfile_screen';
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF212121),
        body: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            top: 20,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: 155.00,
                        width: 155.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Logo.png'),
                            scale: 7,
                          ),
                          border: Border.all(
                            width: 5.00,
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 8,
                        child: Container(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF57BA98),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  height: 50.00,
                  decoration: BoxDecoration(
                    color: Color(0xff212121),
                    border: Border.all(
                      width: 3.00,
                      color: Color(0xff57ba98),
                    ),
                    borderRadius: BorderRadius.circular(32.00),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "jdoe@gmail.com",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  height: 50.00,
                  decoration: BoxDecoration(
                    color: Color(0xff212121),
                    border: Border.all(
                      width: 3.00,
                      color: Color(0xff57ba98),
                    ),
                    borderRadius: BorderRadius.circular(32.00),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Grand Anse, St.George",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  height: 50.00,
                  decoration: BoxDecoration(
                    color: Color(0xff212121),
                    border: Border.all(
                      width: 3.00,
                      color: Color(0xff57ba98),
                    ),
                    borderRadius: BorderRadius.circular(32.00),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "+1(473)459-0921",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  height: 50.00,
                  decoration: BoxDecoration(
                    color: Color(0xff212121),
                    border: Border.all(
                      width: 3.00,
                      color: Color(0xff57ba98),
                    ),
                    borderRadius: BorderRadius.circular(32.00),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Age",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                      Text(
                        '${sliderValue.toInt()}',
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xffb5cfd2),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: Color(0xff57ba98),
                    inactiveColor: Colors.white,
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                    max: 100,
                    min: 18,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          color: Color(0xff3b945e),
                        ),
                      ),
                    ),
                    height: 50.00,
                    width: 200.00,
                    decoration: BoxDecoration(
                      color: Color(0xff212121),
                      border: Border.all(
                        width: 3.00,
                        color: Color(0xff3b945e),
                      ),
                      borderRadius: BorderRadius.circular(25.00),
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
