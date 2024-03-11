// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:trust_travel/classes/headers/utils/utils.dart';
import 'package:trust_travel/classes/screens/travel/details/travel_details.dart';

import '../../../firebase/path/path.dart';
import '../../../methods/methods.dart';

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  //
  var travelStatus = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWithRegularStyle(
          'Travell',
          16.0,
          Colors.black,
        ),
        automaticallyImplyLeading: false,
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        cacheExtent: 9999,
        addAutomaticKeepAlives: true,
        pageSize: 6,
        query: FirebaseFirestore.instance
            .collection(
              createOrAddTravelPath,
            )
            .orderBy('time_stamp', descending: true),
        // .where('active', isEqualTo: 'yes'),
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> allTravels = snapshot.data();
          // print(allEvents);
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        //
                        SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${allTravels['place_photos'][0]['refrence'].toString()}&key=$kGoogle_API_KEY',
                              fit: BoxFit.fill,
                              // memCacheHeight: 120,
                              // memCacheWidth: 140,
                              placeholder: (context, url) => SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: ShimmerLoader(
                                      width:
                                          MediaQuery.of(context).size.width)),
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
                              travelDatesUIKIT(allTravels),
                            ],
                          ),
                          trailing: travelStatusUIKIT(allTravels),
                          onTap: () {
                            // get current date function
                            getCurrentDate();
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

  Padding goingToUIKIT(Map<String, dynamic> allTravels) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 4.0,
        top: 4.0,
      ),
      child: Align(
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
      ),
    );
  }

  Row travelDatesUIKIT(Map<String, dynamic> allTravels) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            right: 0,
            top: 8.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.calendar_month,
              size: 16.0,
            ),
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            top: 8.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: text_regular_poppins(
              //
              allTravels['travel_start_date'] +
                  '\n' +
                  allTravels['travel_end_date'],
              Colors.black,
              10.0,
            ),
          ),
        ),
      ],
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
