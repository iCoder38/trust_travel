// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../headers/utils/utils.dart';

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
          GestureDetector(
            onTap: () {
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
}
