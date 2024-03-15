// import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var strScreenLoader = true;
  var randomNumber = 0;
  var strTravelListStatus = '2';
  @override
  void initState() {
    //
    // allQuery();

    super.initState();
  }

  allQuery() {
    //
    // strTravelListStatus = '1';
    if (strTravelListStatus == '1') {
      var ok = FirebaseFirestore.instance
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
      return ok;
    } else if (strTravelListStatus == '3') {
      var ok = FirebaseFirestore.instance
          .collection(
            createOrAddTravelPath,
          )
          .where('travel_start_date', isGreaterThanOrEqualTo: '2024-04-10');

      return ok;
    } else {
      var ok = FirebaseFirestore.instance
          .collection(
            createOrAddTravelPath,
          )
          .where('travel_start_date', isGreaterThanOrEqualTo: getCurrentDate());
      return ok;
    }
  }

  listViaDates() {
    //
    // strTravelListStatus = '2';
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
              setState(() {
                strTravelListStatus = '1';
              });
            },
            icon: const Icon(
              Icons.abc,
            ),
          ),
          IconButton(
            onPressed: () {
              //
              setState(() {
                strTravelListStatus = '2';
              });
            },
            icon: const Icon(
              Icons.abc_sharp,
            ),
          ),
          IconButton(
            onPressed: () {
              //
              setState(() {
                strTravelListStatus = '3';
              });
            },
            icon: const Icon(
              Icons.abc_sharp,
            ),
          ),
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
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
      ),
    );
  }
}
