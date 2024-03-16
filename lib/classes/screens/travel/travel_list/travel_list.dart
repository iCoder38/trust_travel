// import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:trust_travel/classes/headers/utils/utils.dart';
import 'package:trust_travel/classes/screens/travel/details/travel_details.dart';
import 'package:trust_travel/classes/screens/travel/travel_list/widgets/main_ui_set.dart';
import 'package:trust_travel/classes/screens/travel/travel_list/widgets/travel_compare_dates.dart';
import 'package:trust_travel/classes/screens/travel/travel_list/widgets/travel_dates.dart';
import 'package:trust_travel/classes/screens/travel/travel_list/widgets/travel_going_to.dart';

import '../../../firebase/path/path.dart';
import '../../../methods/methods.dart';

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  //
  var strSelectedDate = '';
  var strScreenLoader = true;
  var randomNumber = 0;
  var strTravelListStatus = '2';
  var filterStatus = false;
  //
  var strGoingStatus = '0';
  @override
  void initState() {
    //
    // allQuery();

    super.initState();
  }

  allQuery() {
    //
    if (kDebugMode) {
      print(strGoingStatus);
    }
    if (strGoingStatus == '0') {
      if (kDebugMode) {
        print('================');
        print('ALL TRAVEL LIST');
        print('================');
      }
      strSelectedDate = '';
      var allQuery = FirebaseFirestore.instance
          .collection(
            createOrAddTravelPath,
          )
          .orderBy('time_stamp', descending: true);

      // .where('travel_start_date', isGreaterThanOrEqualTo: getCurrentDate());
      // .where('travel_end_date', isLessThan: DateTime(2025, 4, 6)),
      // .where('travel_end_date', isLessThanOrEqualTo: getCurrentDate()),
      // .where('t2', isLessThanOrEqualTo: DateTime(2022, 4, 6)),
      // .where('travel_start_date', isGreaterThanOrEqualTo: 1710500026)
      // .orderBy('time_stamp', descending: true),
      return allQuery;
    } else if (strGoingStatus == '1') {
      if (kDebugMode) {
        print('================');
        print('FILTER VIA DATES');
        print('================');
      }
      strSelectedDate = '';
      var filterViaDates = FirebaseFirestore.instance
          .collection(
            createOrAddTravelPath,
          )
          .where('travel_start_date', isGreaterThanOrEqualTo: getCurrentDate());

      return filterViaDates;
    } else if (strGoingStatus == '2') {
      if (kDebugMode) {
        print('================');
        print('CUSTOM DATES');
        print('================');
      }
      var customDates = FirebaseFirestore.instance
          .collection(
            createOrAddTravelPath,
          )
          .where('travel_start_date', isGreaterThanOrEqualTo: strSelectedDate);

      return customDates;
    } else {
      strSelectedDate = '';
      var ok = FirebaseFirestore.instance
          .collection(
            createOrAddTravelPath,
          )
          .where('travel_start_date', isGreaterThanOrEqualTo: getCurrentDate());
      return ok;
    }
  }

  var travelStatus = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: textWithRegularStyle(
            'Travel',
            16.0,
            Colors.black,
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                //
                if (kDebugMode) {
                  print(filterStatus);
                }
                openFilter();
                // openFilter();
              },
              icon: const Icon(
                Icons.tune,
              ),
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Under construction',
          ),
        ) /*FirestoreListView<Map<String, dynamic>>(
        cacheExtent: 9999,
        addAutomaticKeepAlives: true,
        pageSize: 6,
        query: allQuery(),
        // query: allQuery(),
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> allTravels = snapshot.data();

          return GestureDetector(
            onTap: () {
              //
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => const HomeFeedScreen(),
                  builder: (context) => TravelDetailsScreen(
                    getFullDataFromTravel: allTravels,
                  ),
                ),
              );
            },
            child: WidgetTravelUIKit(
              allTravels: allTravels,
            ),
          );
        },
      ), */ /**/
        );
  }

  openFilter() {
    showDialog(
      context: context,
      builder: (_) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //
                            if (kDebugMode) {
                              print('On-going');
                            }
                            if (strGoingStatus != '0') {
                              setState(() {
                                strGoingStatus = '0';
                              });
                              allQuery();
                            }

                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 56.0,
                            child: Center(
                              child: text_bold_poppins(
                                'All',
                                Colors.green,
                                14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //
                            if (kDebugMode) {
                              print('Upcoming');
                            }
                            if (strGoingStatus != '1') {
                              setState(() {
                                strGoingStatus = '1';
                              });
                              allQuery();
                            }

                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 56.0,
                            child: Center(
                              child: text_bold_poppins(
                                'Via Dates',
                                Colors.orangeAccent,
                                14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            //
                            /*if (kDebugMode) {
                            print('completed');
                          }*/
                            DateTime? startPickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100));
                            if (startPickedDate != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(startPickedDate);

                              if (strSelectedDate != formattedDate) {
                                setState(() {
                                  strSelectedDate = formattedDate;
                                  strGoingStatus = '2';
                                });
                                allQuery();
                              }
                              Navigator.pop(context);
                            }
                            /*setState(() {
                            strGoingStatus = '2';
                          });
                          Navigator.pop(context);*/
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 56.0,
                            child: Center(
                              child: text_bold_poppins(
                                'Custom date',
                                Colors.redAccent,
                                14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text_regular_mons(
                        'Your max budget',
                        Colors.black,
                        12.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 6.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Container(
                // A simplified version of dialog.
                width: MediaQuery.of(context).size.width,
                height: 56.0,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    14.0,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          if (kDebugMode) {
                            print('On-going');
                          }
                          if (strGoingStatus != '0') {
                            setState(() {
                              strGoingStatus = '0';
                            });
                            allQuery();
                          }

                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.white,
                          height: 56.0,
                          child: Center(
                            child: text_bold_poppins(
                              'All',
                              Colors.green,
                              14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                          if (kDebugMode) {
                            print('Upcoming');
                          }
                          if (strGoingStatus != '1') {
                            setState(() {
                              strGoingStatus = '1';
                            });
                            allQuery();
                          }

                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.white,
                          height: 56.0,
                          child: Center(
                            child: text_bold_poppins(
                              'Via Dates',
                              Colors.orangeAccent,
                              14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          //
                          /*if (kDebugMode) {
                            print('completed');
                          }*/
                          DateTime? startPickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));
                          if (startPickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd')
                                .format(startPickedDate);

                            if (strSelectedDate != formattedDate) {
                              setState(() {
                                strSelectedDate = formattedDate;
                                strGoingStatus = '2';
                              });
                              allQuery();
                            }
                            Navigator.pop(context);
                          }
                          /*setState(() {
                            strGoingStatus = '2';
                          });
                          Navigator.pop(context);*/
                        },
                        child: Container(
                          color: Colors.white,
                          height: 56.0,
                          child: Center(
                            child: text_bold_poppins(
                              'Custom date',
                              Colors.redAccent,
                              14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      color: Colors.amber,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        readOnly: false,
                        // controller: contStartDate,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Min budget',
                          hintStyle: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        maxLines: 1,
                        // maxLength: 25,
                        // onTap: () async {
                        //   //
                        // },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 50.0,
                      color: Colors.amber,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        readOnly: false,
                        // controller: contStartDate,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Max budget',
                          hintStyle: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        maxLines: 1,
                        // maxLength: 25,
                        // onTap: () async {
                        //   //
                        // },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),*/
      ),
    );
  }
}
