import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/utils/components/logo.dart';
import 'package:greenz_go_app_v2/utils/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';
import 'package:greenz_go_app_v2/utils/widgets/reusableCard.dart';
import 'package:greenz_go_app_v2/utils/widgets/custom_elevated_button.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  bool isSelected = false;
  double sliderValue = 20;
  String _vehicleDropdownValue;
  String _locationDropdownValue;
  RangeValues _rangeValues = const RangeValues(90, 150);
  double sliderMinValue = 90;
  double sliderMaxValue = 150;
  var _startDateChoice = DateTime.now();
  var _endDateChoice = DateTime.now().add(Duration(days: 30));
  var _startTimeChoice = TimeOfDay.now();
  final GlobalKey<FormState> _searchFormKeyValue = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_image_2.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _searchFormKeyValue,
                child: Column(
                  children: [
                    Logo(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Color(0xff2a2a2a),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 20,
                              right: 20,
                            ),
                            child: new FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return Column(
                                  children: [
                                    Text(
                                      'Choose a Vehicle Type',
                                      style: TextStyle(
                                        color: Color(0xff57BA98),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 25,
                                      endIndent: 25,
                                      color: Color(0xff57BA98),
                                    ),
                                    SmartSelect<String>.single(
                                      title: 'Vehicle Type:',
                                      placeholder: 'Select ',
                                      choiceConfig: S2ChoiceConfig(
                                        type: S2ChoiceType.radios,
                                        layout: S2ChoiceLayout.list,
                                        style: S2ChoiceStyle(
                                          titleStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          color: Colors.white,
                                          accentColor: Color(0xff57BA98),
                                          activeColor: Color(0xff57BA98),
                                          activeAccentColor: Color(0xff57BA98),
                                        ),
                                      ),
                                      modalConfig: S2ModalConfig(
                                        type: S2ModalType.popupDialog,
                                        headerStyle: S2ModalHeaderStyle(
                                          backgroundColor:
                                              const Color(0xff57BA98),
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                          ),
                                        ),
                                        style: S2ModalStyle(),
                                      ),
                                      value: _vehicleDropdownValue,
                                      choiceItems: kvehicleType,
                                      onChange: (state) => setState(() =>
                                          _vehicleDropdownValue = state.value),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Select a Parish',
                                      style: TextStyle(
                                        color: Color(0xff57BA98),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 25,
                                      endIndent: 25,
                                      color: Color(0xff57BA98),
                                    ),
                                    SmartSelect<String>.single(
                                      title: 'Location:',
                                      placeholder: 'Select ',
                                      choiceConfig: S2ChoiceConfig(
                                        type: S2ChoiceType.radios,
                                        layout: S2ChoiceLayout.list,
                                        style: S2ChoiceStyle(
                                          titleStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          color: Colors.white,
                                          accentColor: Color(0xff57BA98),
                                          activeColor: Color(0xff57BA98),
                                          activeAccentColor: Color(0xff57BA98),
                                        ),
                                      ),
                                      modalConfig: S2ModalConfig(
                                        type: S2ModalType.popupDialog,
                                        headerStyle: S2ModalHeaderStyle(
                                          backgroundColor:
                                              const Color(0xff57BA98),
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                          ),
                                        ),
                                        style: S2ModalStyle(),
                                      ),
                                      value: _locationDropdownValue,
                                      choiceItems: kparishLocale,
                                      onChange: (state) => setState(() =>
                                          _locationDropdownValue = state.value),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Select a Date and Time',
                                      style: TextStyle(
                                        color: Color(0xff57BA98),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 25,
                                      endIndent: 25,
                                      color: Color(0xff57BA98),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'From: ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    '${DateFormat.yMMMd().format(_startDateChoice)} @ ${_startTimeChoice.hour} : ${_startTimeChoice.minute}',
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'To: ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  SizedBox(
                                                    width: 46,
                                                  ),
                                                  Text(
                                                    '${DateFormat.yMMMd().format(_endDateChoice)} @ ${_startTimeChoice.hour} : ${_startTimeChoice.minute}',
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                          tooltip:
                                              "Press to select a date and time",
                                          splashColor: Color(0xff57BA98),
                                          onPressed: () async {
                                            return await showDateRangePicker(
                                              context: context,
                                              initialDateRange: DateTimeRange(
                                                start: DateTime.now(),
                                                end: DateTime.now()
                                                    .add(Duration(days: 7)),
                                              ),
                                              firstDate: DateTime.now()
                                                  .subtract(Duration(days: 5)),
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 35)),
                                              currentDate: DateTime.now(),
                                              initialEntryMode:
                                                  DatePickerEntryMode.calendar,
                                              confirmText: 'OK',
                                              cancelText: 'Cancel',
                                              saveText: 'Save',
                                              builder: (context, child) =>
                                                  Theme(
                                                      data: darkTheme(),
                                                      child: child),
                                            ).then((dateValue) async {
                                              if (dateValue == null) {
                                                return null;
                                              }
                                              return await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                                confirmText: 'OK',
                                                cancelText: 'Cancel',
                                                initialEntryMode:
                                                    TimePickerEntryMode.dial,
                                                builder: (context, child) =>
                                                    Theme(
                                                        data: darkTheme(),
                                                        child: child),
                                              ).then((timeValue) async {
                                                _startDateChoice =
                                                    dateValue == null
                                                        ? DateTime.now()
                                                        : dateValue.start;
                                                _endDateChoice =
                                                    dateValue == null
                                                        ? DateTime.now()
                                                        : dateValue.end;
                                                _startTimeChoice =
                                                    timeValue == null
                                                        ? TimeOfDay.now()
                                                        : timeValue;
                                              }).then((value) {
                                                setState(() {});
                                              });
                                            });
                                          },
                                          icon: Icon(
                                            Icons.date_range_outlined,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Select a Price range',
                                      style: TextStyle(
                                        color: Color(0xff57BA98),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 25,
                                      endIndent: 25,
                                      color: Color(0xff57BA98),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Text(
                                                'Price: ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 170,
                                            ),
                                            Text(
                                              "\$ ${sliderMinValue.round()} to \$ ${sliderMaxValue.round()}",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RangeSlider(
                                          values: _rangeValues,
                                          onChanged: (RangeValues value) {
                                            setState(() {
                                              _rangeValues = value;
                                              sliderMinValue =
                                                  _rangeValues.start;
                                              sliderMaxValue = _rangeValues.end;
                                            });
                                          },
                                          min: 60,
                                          max: 200,
                                          activeColor: Color(0xff57BA98),
                                          inactiveColor: Colors.white,
                                          divisions: 14,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: CustomElevatedButton(
                          onPressed: () async {
                            try {
                              final FormState formStateVal =
                                  _searchFormKeyValue.currentState;
                              formStateVal.validate();
                              formStateVal.save();
                              print('Vehicle: $_vehicleDropdownValue');
                              print('Location: $_locationDropdownValue');
                              print(
                                  'Date: ${DateFormat.yMMMd().format(_startDateChoice)} to ${DateFormat.yMMMd().format(_endDateChoice)} @ ${_startTimeChoice.hour} : ${_startTimeChoice.minute}');
                              print(
                                  'Price: \$ ${sliderMinValue.round()} to \$ ${sliderMaxValue.round()}');
                            } catch (e) {
                              print(e);
                            }
                          },
                          buttonLabel: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
