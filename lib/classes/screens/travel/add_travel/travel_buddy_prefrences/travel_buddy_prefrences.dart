// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../headers/utils/utils.dart';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class TravelBuddyPrefrencesScreen extends StatefulWidget {
  const TravelBuddyPrefrencesScreen({super.key});

  @override
  State<TravelBuddyPrefrencesScreen> createState() =>
      _TravelBuddyPrefrencesScreenState();
}

class _TravelBuddyPrefrencesScreenState
    extends State<TravelBuddyPrefrencesScreen> {
  //
  var strSelectGender = '1';
  var strAgeRange = '0';
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              // controller: contGoingTo,
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
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => const HomeFeedScreen(),
                  builder: (context) => const TravelBuddyPrefrencesScreen(),
                ),
              );*/
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text_bold_mons(
                      'Next ',
                      Colors.white,
                      18.0,
                    ),
                    text_regular_mons(
                      '4/4 ',
                      Colors.white,
                      12.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
}
