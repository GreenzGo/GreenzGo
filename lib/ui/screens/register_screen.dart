import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/ui/screens/login_screen.dart';
import 'package:greenz_go_app_v2/ui/screens/profile_screen.dart';
import 'package:greenz_go_app_v2/utils/widgets/custom_elevated_button.dart';
import 'package:greenz_go_app_v2/utils/widgets/DataTextField.dart';
import 'package:greenz_go_app_v2/utils/components/logo.dart';
import 'package:greenz_go_app_v2/utils/widgets/reusableCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class RegistrationScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

enum UserType { User, Renter }

class _RegistrationScreenState extends State<RegistrationScreen> {
  double _age = 20;
  UserType _user = UserType.User;
  UserType _renter = UserType.Renter;
  RegFormVal regFormVal = new RegFormVal();
  final _auth = FirebaseAuth.instance;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_image_2.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKeyValue,
            child: ListView(
              children: [
                Logo(),
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: [
                    ReusableCard(
                      cardHeight: 650,
                      cardWidth: 400,
                      colour: Color(0xff2a2a2a),
                      cardChild: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                              ),
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: DataTextFormField(
                                textFieldRadius: textFieldRadius,
                                textFieldName: 'Username',
                                textFieldHint: 'Enter your username',
                                keyboardType: TextInputType.text,
                                hiddenText: false,
                                textFieldIcon: Icons.perm_identity_outlined,
                                validator: (val) =>
                                    val.isEmpty ? 'Username is required' : null,
                                onSaved: (val) => regFormVal.username = val,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: DataTextFormField(
                                textFieldRadius: textFieldRadius,
                                textFieldName: 'Email',
                                textFieldHint: 'Enter your email',
                                hiddenText: false,
                                textFieldIcon: Icons.mail_outlined,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) =>
                                    val.isEmpty ? 'An Email is required' : null,
                                onSaved: (val) => regFormVal.email = val,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: DataTextFormField(
                                textFieldRadius: textFieldRadius,
                                textFieldName: 'Password',
                                textFieldHint: 'Enter your password',
                                keyboardType: TextInputType.text,
                                controller: _pass,
                                hiddenText: true,
                                textFieldIcon:
                                    Icons.enhanced_encryption_outlined,
                                validator: (val) =>
                                    val.isEmpty ? 'Password is required' : null,
                                onSaved: (val) => regFormVal.password = val,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: DataTextFormField(
                                textFieldRadius: textFieldRadius,
                                textFieldName: 'Confirm Password',
                                textFieldHint: 'Reenter your password',
                                keyboardType: TextInputType.text,
                                hiddenText: true,
                                controller: _confirmPass,
                                textFieldIcon:
                                    Icons.domain_verification_outlined,
                                validator: (val) {
                                  if (val.isEmpty) return 'Empty';
                                  if (val != _pass.text) return 'Not a Match!';
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Age",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    "${_age.toInt()}",
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              onChanged: (newValue) {
                                setState(() {
                                  _age = newValue;
                                  regFormVal.age = _age.toInt().round();
                                });
                              },
                              value: _age,
                              max: 80,
                              min: 18,
                              activeColor: Color(0xff57ba98),
                              inactiveColor: Colors.white,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 10.0,
                                  ),
                                  child: Text(
                                    'Member Type',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                RadioListTile<UserType>(
                                  title: Text(
                                    "User",
                                  ),
                                  value: UserType.User,
                                  groupValue: _user,
                                  onChanged: (UserType value) {
                                    setState(() {
                                      _user = value;
                                      regFormVal.accountType = _user.toString();
                                    });
                                  },
                                  activeColor: Color(0xff57ba98),
                                ),
                                RadioListTile<UserType>(
                                  title: Text(
                                    "Renter",
                                  ),
                                  value: UserType.Renter,
                                  groupValue: _renter,
                                  onChanged: (UserType value) {
                                    setState(() {
                                      _renter = value;
                                      regFormVal.accountType =
                                          _renter.toString();
                                    });
                                  },
                                  activeColor: Color(0xff57ba98),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      left: 130,
                      child: CustomElevatedButton(
                        onPressed: () async {
                          try {
                            final FormState formStateVal =
                                _formKeyValue.currentState;
                            formStateVal.validate();
                            formStateVal.save();
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: regFormVal.email,
                                    password: regFormVal.password);
                            if (newUser != null) {
                              Navigator.pushNamed(context, ProfileScreen.id);
                            }
                            _firestore.collection('users').add({
                              'accountType': regFormVal.accountType,
                              'age': regFormVal.age,
                              'email': regFormVal.email,
                              'username': regFormVal.username,
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        buttonLabel: 'Register',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        'Already have an Account?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, LoginScreen.id);
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
