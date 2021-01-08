import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/api/greenz_go_api.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/utils/components/logo.dart';
import 'package:greenz_go_app_v2/utils/widgets/custom_elevated_button.dart';
import 'package:greenz_go_app_v2/utils/widgets/DataTextField.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:greenz_go_app_v2/model/user.dart';

import '../../constants.dart';

enum AuthMode { Register, Login }
enum UserType { User, Renter }

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  double _age = 18;
  UserAccnt _user = new UserAccnt();
  UserType _userType = UserType.User;
  AuthMode _authMode = AuthMode.Login;
  String initialCountryCode = 'GND';
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'GND');
  String parish;
  final GlobalKey<FormState> _loginFormKey = new GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();

  void _submitForm() {
    if (!_loginFormKey.currentState.validate()) {
      return;
    }
    _loginFormKey.currentState.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      register(_user, authNotifier);
    }
  }

  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);

    super.initState();
  }

  Widget _buildDisplayNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        labelText: 'Display Name',
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.perm_identity_outlined,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Display Name is required';
        }
        if (value.length < 5 || value.length > 20) {
          return 'Display Name must be between 5 and 20 characters';
        }
        return null;
      },
      onSaved: (String value) {
        _user.displayName = value;
      },
    );
  }

  Widget _buildEmailNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        labelText: 'Email',
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.mail_outlined,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.enhanced_encryption_outlined,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordController,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 5 || value.length > 20) {
          return 'Display Name must be between 5 and 20 characters';
        }
        return null;
      },
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        labelText: 'Confirm Password',
        hintText: 'Re-Enter your password',
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.domain_verification_outlined,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Re-Enter your password';
        }
        if (value != _passwordController.text) {
          return 'Passwords do not Match!';
        }
        return null;
      },
    );
  }

  Widget _buildAgeFieldName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Age",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          "${_age.toInt()}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Widget _buildAgeSlider() {
    return Slider(
      onChanged: (newValue) {
        setState(() {
          _age = newValue;
          _user.age = _age.toInt().round();
        });
      },
      value: _age,
      max: 80,
      min: 18,
      activeColor: Color(0xff57ba98),
      inactiveColor: Colors.white,
    );
  }

  Widget _buildAccountTypeRadioBtn() {
    return Column(
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
          toggleable: true,
          selected: false,
          title: Text(
            "User",
          ),
          value: UserType.User,
          groupValue: _userType,
          onChanged: (UserType value) {
            setState(() {
              _userType = value;
              _user.accountType = _userType.toString();
            });
          },
          activeColor: Color(0xff57ba98),
        ),
        RadioListTile<UserType>(
          toggleable: true,
          selected: false,
          title: Text(
            "Renter",
          ),
          value: UserType.Renter,
          groupValue: _userType,
          onChanged: (UserType value) {
            setState(() {
              _userType = value;
              _user.accountType = _userType.toString();
            });
          },
          activeColor: Color(0xff57ba98),
        ),
      ],
    );
  }

  Widget _buildPhoneTextField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      selectorConfig:
          SelectorConfig(selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
      ignoreBlank: false,
      initialValue: phoneNumber,
      keyboardType: TextInputType.phone,
      selectorTextStyle: TextStyle(fontSize: 16),
      inputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        labelText: 'Phone Number',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is required';
        }
        return null;
      },
      onSaved: (value) {
        _user.phoneNumber = value.phoneNumber;
      },
    );
  }

  Widget _buildUserAddressTextField() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        border: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: 'Address',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        hintText: 'Address of Rental',
        prefixIcon: Icon(Icons.location_on_rounded),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.streetAddress,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (value) {
        if (value.isEmpty) {
          return 'Rental Address is required';
        }
        if (value.length < 4) {
          return 'Vehicle Seats must be 4 characters or more';
        }
        return null;
      },
      onSaved: (value) {
        _user.address = value;
      },
    );
  }

  Widget _buildRentalParishTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(),
        color: Color(0xff121212),
      ),
      child: DropdownButtonFormField(
        items:
            kparishDropDownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff57BA98),
            ),
            borderRadius: textFieldRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: textFieldRadius,
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Color(0xff121212),
        ),
        onChanged: (value) {
          setState(() {
            parish = value;
          });
        },
        value: parish,
        hint: Text(
          'Select a parish',
          style: TextStyle(fontSize: 12),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Rental Address is required';
          }
          return null;
        },
        onSaved: (value) {
          _user.parish = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Building login');
    return SafeArea(
      child: Container(
        constraints:
            BoxConstraints.expand(height: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_image_2.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _loginFormKey,
              child: Column(
                children: [
                  Logo(),
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: _authMode == AuthMode.Login ? 300 : 670,
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: Color(0xff2a2a2a),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                _authMode == AuthMode.Login
                                    ? 'Login'
                                    : 'Register',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              _authMode == AuthMode.Register
                                  ? _buildDisplayNameTextField()
                                  : Container(),
                              _buildEmailNameTextField(),
                              _buildPasswordTextField(),
                              _authMode == AuthMode.Register
                                  ? _buildConfirmPasswordTextField()
                                  : Container(),
                              _authMode == AuthMode.Register
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : Container(),
                              _authMode == AuthMode.Register
                                  ? _buildAgeFieldName()
                                  : Container(),
                              _authMode == AuthMode.Register
                                  ? _buildAgeSlider()
                                  : Container(),
                              _authMode == AuthMode.Register
                                  ? _buildAccountTypeRadioBtn()
                                  : Container(),
                              _authMode == AuthMode.Register
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomElevatedButton(
                                onPressed: () => _submitForm(),
                                buttonLabel:
                                    '${_authMode == AuthMode.Login ? 'Login' : 'Register'}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_authMode == AuthMode.Login ? "Don't have an account?" : "Already have an account?"}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            print('Auth Changed');
                            _authMode = _authMode == AuthMode.Login
                                ? AuthMode.Register
                                : AuthMode.Login;
                          });
                        },
                        child: Text(
                          '${_authMode == AuthMode.Login ? 'Register' : 'Login'}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
