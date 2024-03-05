// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bottom_bar/bottom_bar.dart';
import '../../../../firebase/path/path.dart';
import '../../../../headers/utils/utils.dart';

// import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class TravelBuddyPrefrencesScreen extends StatefulWidget {
  const TravelBuddyPrefrencesScreen(
      {super.key,
      required this.getInBuddyTripTitle,
      required this.getInBuddyYouFrom,
      required this.getInBuddyGoingTo,
      required this.getInBuddyStartDate,
      required this.getInBuddyEndDate,
      required this.getModeVehicle,
      required this.getModeVehicleName,
      required this.getModeVehicleSeatCapacity,
      required this.getModeVehicleGas,
      required this.getTotalNumberOfDays,
      this.arrGetStayData});

  final String getInBuddyTripTitle;
  final String getInBuddyYouFrom;
  final String getInBuddyGoingTo;
  final String getInBuddyStartDate;
  final String getInBuddyEndDate;
  final String getModeVehicle;
  final String getModeVehicleName;
  final String getModeVehicleSeatCapacity;
  final String getModeVehicleGas;
  final String getTotalNumberOfDays;
  final arrGetStayData;

  @override
  State<TravelBuddyPrefrencesScreen> createState() =>
      _TravelBuddyPrefrencesScreenState();
}

class _TravelBuddyPrefrencesScreenState
    extends State<TravelBuddyPrefrencesScreen> {
  //
  final formKey = GlobalKey<FormState>();
  late final TextEditingController contAgeRange;
  var strButtonLoader = false;
  var dictSaveFullData;
  var strSelectGender = '1';
  var strAgeRange = '0';
  var arrFilterData = [];
  //
  @override
  void initState() {
    //
    contAgeRange = TextEditingController();
    getAllValuesFromPreviusPage();
    super.initState();
  }

  @override
  void dispose() {
    contAgeRange.dispose();
    super.dispose();
  }

  getAllValuesFromPreviusPage() {
    /*if (kDebugMode) {
      print('=============================');
      print('TITLE ====> ${widget.getInBuddyTripTitle}');
      print('YOU FROM ====> ${widget.getInBuddyYouFrom}');
      print('GOING TO ====> ${widget.getInBuddyGoingTo}');
      print('START DATE ====> ${widget.getInBuddyStartDate}');
      print('END DATE ====> ${widget.getInBuddyEndDate}');
      print('P. MODE ====> ${widget.getModeVehicle}');
      print('V. NAME ====> ${widget.getModeVehicleName}');
      print('SEAT ====> ${widget.getModeVehicleSeatCapacity}');
      print('GAS ====> ${widget.getModeVehicleGas}');
      print('DAYS ====> ${widget.getTotalNumberOfDays}');
      print('=============================');
    }*/
    //
    dictSaveFullData = {
      'title': widget.getInBuddyTripTitle,
      'your_from': widget.getInBuddyYouFrom,
      'going_to': widget.getInBuddyGoingTo,
      'start_date': widget.getInBuddyStartDate,
      'end_date': widget.getInBuddyEndDate,
      'public_mode': widget.getModeVehicle,
      'vehicle_name': widget.getModeVehicleName,
      'vehicle_seat': widget.getModeVehicleSeatCapacity,
      'vehicle_gas': widget.getModeVehicleGas,
      'number_of_days': widget.getTotalNumberOfDays,
    };
    if (kDebugMode) {
      print('=============================');
      print(dictSaveFullData);
      print(widget.arrGetStayData);
      print('=============================');
    }
    for (int i = 0; i < widget.arrGetStayData.length; i++) {
      //
      if (widget.arrGetStayData[i]['status'] == '1') {
        //
        // print(widget.arrGetStayData[i]['name']);
        arrFilterData.add(widget.arrGetStayData[i]['name']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: text_bold_open(
                    'Your Buddy preference',
                    const Color.fromARGB(200, 0, 0, 0),
                    26.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, top: 10, left: 24.0, right: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: text_regular_mons(
                  'Whom would you like to travel with ?',
                  Colors.black,
                  10.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  if (strSelectGender == '1') ...[
                    //
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //

                          setState(() {
                            strSelectGender = '1';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 12.0,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.4,
                            ),
                            color: const Color.fromARGB(200, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent,
                            //       spreadRadius: 3),
                            // ],
                          ),
                          /**/
                          child: Center(
                            child: textWithRegularStyle(
                              'Male',
                              12.0,
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '2';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent, spreadRadius: 3),
                            // ],
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Female',
                              12.0,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '3';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 16.0,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent, spreadRadius: 3),
                            // ],
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Anyone',
                              12.0,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ] else if (strSelectGender == '2') ...[
                    //
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '1';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 12.0,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent, spreadRadius: 3),
                            // ],
                          ),
                          /**/
                          child: Center(
                            child: textWithRegularStyle(
                              'Male',
                              12.0,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          setState(() {
                            strSelectGender = '2';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: const Color.fromARGB(200, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent,
                            //       spreadRadius: 3),
                            // ],
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Female',
                              12.0,
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '3';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 16.0,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent, spreadRadius: 3),
                            // ],
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Anyone',
                              12.0,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    //
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '1';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 12.0,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent, spreadRadius: 3),
                            // ],
                          ),
                          /**/
                          child: Center(
                            child: textWithRegularStyle(
                              'Male',
                              12.0,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '2';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent,
                            //       spreadRadius: 3),
                            // ],
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Female',
                              12.0,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          // HapticFeedback.lightImpact();
                          setState(() {
                            strSelectGender = '3';
                          });
                          /*contSetName.text = (strSelectGender == '1')
                                ? '${randomNames.manFullName()}'
                                : (strSelectGender == '2')
                                    ? '${randomNames.womanFullName()}'
                                    : '${randomNames.name()}';*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 16.0,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                            ),
                            color: const Color.fromARGB(200, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.blueAccent,
                            //       spreadRadius: 3),
                            // ],
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Anyone',
                              12.0,
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: text_bold_open(
                    'Age Range',
                    const Color.fromARGB(200, 0, 0, 0),
                    26.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 24.0, right: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: text_regular_mons(
                  'What age range you want in your buddy ?',
                  Colors.black,
                  10.0,
                ),
              ),
            ),

            // AGE RANGE :
            /*Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 18.0,
                      right: 18.0,
                    ),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.4,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                    child: Center(
                      child: textWithRegularStyle(
                        '18 - 25',
                        12.0,
                        Colors.black,
                      ),
                    ),
                  ),
                  /*: Container(
                          margin: const EdgeInsets.only(
                            left: 18.0,
                            right: 18.0,
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.4,
                            ),
                            color: const Color.fromARGB(200, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: Center(
                            child: textWithRegularStyle(
                              'Male',
                              12.0,
                              Colors.white,
                            ),
                          ),
                        ),*/
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      // left: 18.0,
                      right: 18.0,
                    ),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.4,
                      ),
                      color: const Color.fromARGB(200, 0, 0, 0),
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                    child: Center(
                      child: textWithRegularStyle(
                        '18 - 25',
                        12.0,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),*/
            Padding(
              padding: const EdgeInsets.only(right: 24.0, left: 24.0),
              child: TextFormField(
                readOnly: true,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                controller: contAgeRange,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintStyle: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 12,
                  ),
                  hintText: 'please select age range',
                ),
                maxLines: 1,
                // maxLength: 25,
                onTap: () {
                  //
                  FocusScope.of(context).unfocus();
                  showActionSheet(context);
                  //
                  /*showAdaptiveActionSheet(
                    context: context,
                    title: const Text('Title'),
                    androidBorderRadius: 30,
                    actions: <BottomSheetAction>[
                      BottomSheetAction(
                          title: const Text('Item 1'), onPressed: (context) {}),
                      BottomSheetAction(
                          title: const Text('Item 2'), onPressed: (context) {}),
                      BottomSheetAction(
                          title: const Text('Item 3'), onPressed: (context) {}),
                    ],
                    cancelAction: CancelAction(
                        title: const Text(
                            'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                  );*/
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() {
                  strButtonLoader = true;
                });
                if (formKey.currentState!.validate()) {
                  saveAddTravelDataInDB();
                }

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     // builder: (context) => const HomeFeedScreen(),
                //     builder: (context) => const TravelBuddyPrefrencesScreen(),
                //   ),
                // );
              },
              child: Container(
                margin: const EdgeInsets.all(16.0),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 0, 0, 0),
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                child: Center(
                  child: strButtonLoader == true
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.0,
                        )
                      : text_bold_mons(
                          'Next ',
                          Colors.white,
                          18.0,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  void showActionSheet(BuildContext context) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: text_bold_mons(
          'Age range',
          Colors.black,
          16.0,
        ),
        message: null,
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              contAgeRange.text = '18 - 25';
              Navigator.pop(context);
            },
            child: text_regular_mons(
              '18 - 25',
              Colors.black,
              14.0,
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              contAgeRange.text = '26 - 35';
              Navigator.pop(context);
            },
            child: text_regular_mons(
              '26 - 35',
              Colors.black,
              14.0,
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              contAgeRange.text = '36 - 45';
              Navigator.pop(context);
            },
            child: text_regular_mons(
              '36 - 45',
              Colors.black,
              14.0,
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              contAgeRange.text = '46 - 55';
              Navigator.pop(context);
            },
            child: text_regular_mons(
              '46 - 55',
              Colors.black,
              14.0,
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              contAgeRange.text = '55+';
              Navigator.pop(context);
            },
            child: text_regular_mons(
              '55+',
              Colors.black,
              14.0,
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: text_bold_mons(
              'Dismiss',
              Colors.redAccent,
              16.0,
            ),
          ),
        ],
      ),
    );
  }

  //
  /*
  final String getInBuddyTripTitle;
  final String getInBuddyYouFrom;
  final String getInBuddyGoingTo;
  final String getInBuddyStartDate;
  final String getInBuddyEndDate;
  final String getModeVehicle;
  final String getModeVehicleName;
  final String getModeVehicleSeatCapacity;
  final String getModeVehicleGas;
  final String getTotalNumberOfDays;
  */

  saveAddTravelDataInDB() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(createTravelPath);
    users
        .add(
          {
            // creator info
            'travel_user_id': 'dummy_id',
            'travel_user_name': 'dummy_name',
            // all travel details
            'travel_title': widget.getInBuddyTripTitle.toString(),
            'travel_you_from': widget.getInBuddyYouFrom.toString(),
            'travel_going_to': widget.getInBuddyGoingTo.toString(),
            'travel_start_date': widget.getInBuddyStartDate.toString(),
            'travel_end_date': widget.getInBuddyEndDate.toString(),
            'travel_public_mode': widget.getModeVehicle.toString(),
            'travel_vehicle_name': widget.getModeVehicleName.toString(),
            'travel_vehicle_seat': widget.getModeVehicleSeatCapacity.toString(),
            'travel_vehicle_gas': widget.getModeVehicleGas.toString(),
            'travel_number_of_days': widget.getTotalNumberOfDays.toString(),
            'travel_buddy_prefrence': strSelectGender.toString(),
            'travel_age_range': contAgeRange.text.toString(),
            'travel_stays': arrFilterData,
            // time
            'time_Stamp': DateTime.now().millisecondsSinceEpoch,
          },
        )
        .then(
          (value) =>
              //
              updateTravelDocument(value.id),
          //
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }

  updateTravelDocument(documentId) {
    FirebaseFirestore.instance.collection(createTravelPath).doc(documentId).set(
      {
        'document_id': documentId.toString(),
      },
      SetOptions(merge: true),
    ).then(
      (value1) {
        // success
        if (kDebugMode) {
          print('==============================================');
          print('========== CREATE TRAVEL SUCCESSFULLY ========');
          print('==============================================');
        }
        final snackBar = SnackBar(
          content: text_bold_mons(
            'Successfully created',
            Colors.white,
            14.0,
          ),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          strButtonLoader = false;
        });
        successPush();
      },
    );
  }

  successPush() {
    Navigator.push(
      context,
      MaterialPageRoute(
          // builder: (context) => const HomeFeedScreen(),
          builder: (context) => const BottomBarScreen(specificBarIndex: 2)),
    );
  }
}
