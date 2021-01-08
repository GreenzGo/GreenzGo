import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/model/vehicle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';
import 'package:provider/provider.dart';

class VehicleForm extends StatefulWidget {
  @override
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  String _vehicleDriveTypeValue;
  String _vehicleTypeValue;
  String _rentalParishValue;
  Vehicle _currentVehicle;
  String _vehicleOwner;
  bool _vehicleStatus = true;
  int _rating = 0;
  Timestamp _timeStamp;
  final GlobalKey<FormState> _vehicleFormKey = new GlobalKey<FormState>();
  BorderRadius _textFieldRadius = BorderRadius.circular(30);

  @override
  void initState() {
    VehicleNotifier vehicleNotifier =
        Provider.of<VehicleNotifier>(context, listen: false);
    if (vehicleNotifier.currentVehicle != null) {
      _currentVehicle = vehicleNotifier.currentVehicle;
    } else {
      _currentVehicle = Vehicle();
    }

    _rentalParishValue = _currentVehicle.rentalParish;
    _vehicleTypeValue = _currentVehicle.vehicleType;
    _vehicleDriveTypeValue = _currentVehicle.driveType;

    super.initState();
  }

  void _submitForm() {
    _currentVehicle.vehicleRate = _rating;
    _currentVehicle.vehicleStatus = _vehicleStatus;
    _currentVehicle.createdAt = _timeStamp;
    _currentVehicle.vehicleOwner = _vehicleOwner;

    if (!_vehicleFormKey.currentState.validate()) {
      return;
    }
    _vehicleFormKey.currentState.save();

    // if(null){}else{}
  }

  void _clearForm() {
    _vehicleFormKey.currentState.reset();
  }

  Widget _buildVehicleMakeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: _textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: _textFieldRadius,
        ),
        labelText: 'Vehicle Make',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        filled: true,
        hintText: 'Toyota, Honda, Kia...',
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.text,
      initialValue: _currentVehicle.vehicleMake,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Vehicle Make is required';
        }
        if (value.length < 3 || value.length > 12) {
          return 'Vehicle Make must be more than 3 and less than 12 characters';
        }
        return null;
      },
      onSaved: (String value) {
        _currentVehicle.vehicleMake = value;
      },
    );
  }

  Widget _buildVehicleModelTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: _textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: _textFieldRadius,
        ),
        labelText: 'Vehicle Model',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        filled: true,
        hintText: 'Corolla, CR-V, Swift...',
        fillColor: Color(0xff121212),
      ),
      initialValue: _currentVehicle.vehicleModel,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Vehicle Model is required';
        }
        if (value.length < 3 || value.length > 12) {
          return 'Vehicle Model must be more than 3 and less than 12 characters';
        }
        return null;
      },
      onSaved: (String value) {
        _currentVehicle.vehicleModel = value;
      },
    );
  }

  Widget _buildVehicleTypeTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(),
        color: Color(0xff121212),
      ),
      child: DropdownButtonFormField(
        items: kVehicleTypeDropDownItems
            .map<DropdownMenuItem<String>>((String value) {
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
            borderRadius: _textFieldRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: _textFieldRadius,
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Color(0xff121212),
        ),
        onChanged: (value) {
          setState(() {
            _vehicleTypeValue = value;
          });
        },
        value: _vehicleTypeValue,
        hint: Text(
          'Select a vehicle type',
          style: TextStyle(fontSize: 12),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Vehicle Type is required';
          }
          return null;
        },
        onSaved: (value) {
          _currentVehicle.vehicleType = value;
        },
      ),
    );
  }

  Widget _buildDriveTypeTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(),
        color: Color(0xff121212),
      ),
      child: DropdownButtonFormField(
        items: kdriveTypeDropDownItems
            .map<DropdownMenuItem<String>>((String value) {
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
            borderRadius: _textFieldRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: _textFieldRadius,
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Color(0xff121212),
        ),
        onChanged: (value) {
          setState(() {
            _vehicleDriveTypeValue = value;
          });
        },
        value: _vehicleDriveTypeValue,
        hint: Text(
          'Select a drive type',
          style: TextStyle(fontSize: 12),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Drive Type is required';
          }
          return null;
        },
        onSaved: (value) {
          _currentVehicle.driveType = value;
        },
      ),
    );
  }

  Widget _buildVehicleSeatTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: _textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: _textFieldRadius,
        ),
        labelText: 'Vehicle Seats',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      initialValue: _currentVehicle.vehicleSeats == null
          ? null
          : _currentVehicle.vehicleSeats.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (value) {
        if (value.isEmpty) {
          return 'Vehicle Seats number is required';
        }
        if (value.length > 2) {
          return 'Vehicle Seats must be 2 characters or less';
        }
        return null;
      },
      onSaved: (value) {
        _currentVehicle.vehicleSeats = int.parse(value);
      },
    );
  }

  Widget _buildVehicleRateTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: _textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: _textFieldRadius,
        ),
        labelText: 'Rental Cost',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        hintText: 'Enter the cost for rental per day',
        filled: true,
        fillColor: Color(0xff121212),
      ),
      initialValue: _currentVehicle.vehicleRate == null
          ? null
          : _currentVehicle.vehicleRate.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (value) {
        if (value.isEmpty) {
          return 'Rental cost is required';
        }
        if (value.length < 2 || value.length > 4) {
          return 'Rental Cost must be between 3 or 4 characters';
        }
        return null;
      },
      onSaved: (value) {
        _currentVehicle.vehicleRate = int.parse(value);
      },
    );
  }

  Widget _buildVehicleDescTextField() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: _textFieldRadius,
        ),
        border: OutlineInputBorder(
          borderRadius: _textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: 'Vehicle Description',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      initialValue: _currentVehicle.vehicleDesc,
      maxLines: 6,
      keyboardType: TextInputType.multiline,
      style: TextStyle(fontSize: 16),
      cursorColor: Color(0xff57BA98),
      validator: (value) {
        if (value.isEmpty) {
          return 'Vehicle Description is required';
        }
        if (value.length < 5) {
          return 'Vehicle Description must be 5 characters or more';
        }
        return null;
      },
      onSaved: (value) {
        _currentVehicle.vehicleDesc = value;
      },
    );
  }

  Widget _buildRentalAddressTextField() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: _textFieldRadius,
        ),
        border: OutlineInputBorder(
          borderRadius: _textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: 'Address',
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        hintText: 'Address of Rental',
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: TextInputType.streetAddress,
      initialValue: _currentVehicle.rentalAddress,
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
        _currentVehicle.rentalAddress = value;
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
            borderRadius: _textFieldRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: _textFieldRadius,
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Color(0xff121212),
        ),
        onChanged: (value) {
          setState(() {
            _rentalParishValue = value;
          });
        },
        value: _rentalParishValue,
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
          _currentVehicle.rentalParish = value;
        },
      ),
    );
  }

  Widget _showVehicleImage() {
    return Text('Vehicle Image');
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    _vehicleOwner = authNotifier.user.displayName;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background_image_2.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Vehicle Form',
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.5,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Form(
              key: _vehicleFormKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  _showVehicleImage(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Add Vehicle',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add Image'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVehicleMakeTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVehicleModelTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVehicleTypeTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildDriveTypeTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVehicleSeatTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVehicleRateTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVehicleDescTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildRentalAddressTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildRentalParishTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54),
                        ),
                        onPressed: () {
                          _clearForm();
                        },
                        child: Text(
                          'Clear'.toUpperCase(),
                        ),
                      ),
                    ],
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
