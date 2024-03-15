// import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:trust_travel/classes/screens/travel/travel_list/widgets/travel_dates.dart';

import '../../../firebase/path/path.dart';
import '../../../methods/methods.dart';

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  //
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
            icon: Icon(
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
            icon: Icon(
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
            icon: Icon(
              Icons.abc_sharp,
            ),
          ),
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        // shrinkWrap: true,
        cacheExtent: 9999,
        addAutomaticKeepAlives: true,
        pageSize: 6,
        query: allQuery(),
        // query: allQuery(),
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> allTravels = snapshot.data();
          // if (kDebugMode) {
          // print(strTravelListStatus);
          // print(snapshot);
          // }
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        //
                        SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width - 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=4000&photoreference=${allTravels['place_photos'][0]['refrence'].toString()}&key=$kGoogle_API_KEY',
                              fit: BoxFit.cover,
                              // memCacheHeight: 120,
                              // memCacheWidth: 140,
                              placeholder: (context, url) => SizedBox(
                                height: 40,
                                width: 40,
                                child: ShimmerLoader(
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        ListTile(
                          title: text_bold_poppins(
                            //
                            allTravels['travel_title'],
                            Colors.black,
                            18.0,
                          ),
                          subtitle: Column(
                            children: [
                              //
                              goingToUIKIT(allTravels),
                              //
                              WidgetTravelDatesUIKit(
                                startDate: allTravels['travel_start_date'],
                                endDate: allTravels['travel_end_date'],
                                numberOfDays:
                                    allTravels['travel_number_of_days'],
                              )
                            ],
                          ),
                          trailing: travelStatusUIKIT(allTravels),
                          onTap: () {
                            // get current date function
                            // getCurrentDate();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TravelDetailsScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Align goingToUIKIT(Map<String, dynamic> allTravels) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ReadMoreText(
        //
        allTravels['travel_going_to'] +
            ', via ' +
            allTravels['travel_public_mode'],
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 10.0,
        ),
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: '...Show more',
        trimExpandedText: '...Show less',
        moreStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.pinkAccent,
        ),
        lessStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  Column travelStatusUIKIT(Map<String, dynamic> allTravels) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text_regular_poppins(
          '2.3k Members',
          Colors.black,
          12.0,
        ),
        if (compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ) ==
            'on-going') ...[
          text_regular_mons(
            compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ),
            const Color.fromARGB(255, 231, 56, 3),
            12.0,
          ),
        ] else if (compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ) ==
            'expired') ...[
          text_regular_mons(
            compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ),
            const Color.fromARGB(255, 247, 18, 1),
            12.0,
          ),
        ] else if (compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ) ==
            'upcoming') ...[
          text_regular_mons(
            compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ),
            Colors.green,
            12.0,
          ),
        ] else if (compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ) ==
            'last day') ...[
          text_bold_mons(
            compareDates(
              allTravels['travel_start_date'],
              allTravels['travel_end_date'],
            ),
            Colors.purple,
            12.0,
          ),
        ]

        // text_regular_poppins(
        //   //
        //   .toString(),
        //   Colors.green,
        //   10.0,
        // ),
      ],
    );
  }
}
