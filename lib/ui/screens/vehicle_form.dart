import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/model/vehicle.dart';
import 'package:greenz_go_app_v2/api/greenz_go_api.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

//TODO:#9.1 Clean up code and optimize

class VehicleForm extends StatefulWidget {
  final bool isUpdating;
  VehicleForm({@required this.isUpdating});
  @override
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  String _vehicleDriveTypeValue;
  String _vehicleTypeValue;
  String _rentalParishValue;
  Vehicle _currentVehicle;
  String _imageURL;
  File _imageFile;
  String _vehicleOwner;
  String _vehicleStatus;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _vehicleFormKey = new GlobalKey<FormState>();
  BorderRadius _textFieldRadius = BorderRadius.circular(30);

  //calls th initState of VehicleForm
  @override
  void initState() {
    VehicleNotifier vehicleNotifier =
        Provider.of<VehicleNotifier>(context, listen: false);

    //sets _currentVehicle to an already selected vehicle with its corresponding data or a new vehicle object
    if (vehicleNotifier.currentVehicle != null) {
      _currentVehicle = vehicleNotifier.currentVehicle;
    } else {
      _currentVehicle = Vehicle();
    }

    _rentalParishValue = _currentVehicle.rentalParish;
    _vehicleTypeValue = _currentVehicle.vehicleType;
    _vehicleDriveTypeValue = _currentVehicle.driveType;
    _imageURL = _currentVehicle.image;
    _vehicleOwner = _currentVehicle.vehicleOwner;
    _vehicleStatus = _currentVehicle.vehicleStatus;

    super.initState();
  }

  //submits the data in VehicleForm to their respective variables
  void _submitForm() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (!_vehicleFormKey.currentState.validate()) {
      return;
    }
    _vehicleFormKey.currentState.save();

    _currentVehicle.vehicleStatus = _vehicleStatus;
    _currentVehicle.vehicleOwner = _vehicleOwner;

    uploadVehicleWithImage(_currentVehicle, widget.isUpdating, _imageFile);

    Navigator.pop(context);
    // if(null){}else{}
  }

  //clears all data in the current Vehicle Form
  void _clearForm() {
    _vehicleFormKey.currentState.reset();
  }

  //allows user to select a local image from their device gallery
  Future<File> _getLocalImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 75,
      maxWidth: MediaQuery.of(context).size.width,
    );
    print('PickedFile: ${pickedFile.toString()}');

    setState(() {
      _imageFile = File(pickedFile.path);
    });

    if (_imageFile != null) {
      return _imageFile;
    }
    return null;
  }

  //creates vehicle make text field
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

  //creates vehicle model text field
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

  //creates vehicle type drop down field
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
        onSaved: (value) {
          _currentVehicle.vehicleType = value;
        },
      ),
    );
  }

  //creates drive type drop down field
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
        onSaved: (value) {
          _currentVehicle.driveType = value;
        },
      ),
    );
  }

  //creates vehicle status drop down field
  Widget _buildVehicleStatusTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(),
        color: Color(0xff121212),
      ),
      child: DropdownButtonFormField(
        items: kvehicleStatusDropDownItems
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
            _vehicleStatus = value;
          });
        },
        value: _vehicleStatus,
        hint: Text(
          'Select vehicle status',
          style: TextStyle(fontSize: 12),
        ),
        onSaved: (value) {
          _currentVehicle.vehicleStatus = value;
        },
      ),
    );
  }

  //creates vehicle seat text field
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

  //creates vehicle rate text field
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

  //creates vehicle description text field
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

  //creates renter address text field
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
          return 'Address is required';
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

  //creates parish drop down field
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
        onSaved: (value) {
          _currentVehicle.rentalParish = value;
        },
      ),
    );
  }

  //displays vehicle image and allows it to be changed
  Widget _showVehicleImage() {
    if (_imageFile == null && _imageURL == null) {
      return Column(
        children: [
          Icon(
            Icons.image_not_supported_rounded,
            size: 55,
          ),
          Text('No image'),
        ],
      );
    } else if (_imageFile != null) {
      print('showing image from local file');
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 230,
          ),
          FlatButton(
            onPressed: () => _getLocalImage(),
            color: Colors.black26,
            child: Text(
              'Change Image',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    } else if (_imageURL != null) {
      print('showing network image');
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: _imageURL,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
                height: 230,
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          FlatButton(
            onPressed: () => _getLocalImage(),
            color: Colors.black26,
            child: Text(
              'Change Image',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  _showVehicleImage(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.isUpdating ? 'Edit Vehicle' : 'Add Vehicle',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _imageFile == null && _imageURL == null
                      ? ElevatedButton(
                          onPressed: () => _getLocalImage(),
                          child: Text(
                            'Add Image'.toUpperCase(),
                          ),
                        )
                      : SizedBox(height: 5),
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
                  widget.isUpdating
                      ? _buildVehicleStatusTextField()
                      : SizedBox(height: 0),
                  widget.isUpdating
                      ? SizedBox(height: 25)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () => _submitForm(),
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
                                    MaterialStateProperty.all<Color>(
                                        Colors.black54),
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
        //allows user to update current vehicle form data
        floatingActionButton: widget.isUpdating
            ? FloatingActionButton(
                onPressed: () => _submitForm(),
                child: Icon(Icons.save_rounded),
                foregroundColor: Colors.white,
              )
            : null,
      ),
    );
  }
}
