/* ////////////////////////////////////////////////////////////////// */
/* ////////////////////// create event ////////////////////// */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../headers/utils/utils.dart';
import '../screens/travel/add_travel/travel_details_two/travel_details_two.dart';

checkDatesValidation(
  context,
  startDate,
  endDate,
  title,
  youFrom,
  goingTo,
) {
  //
  DateTime date1 = DateTime.parse(startDate.toString());
  DateTime date2 = DateTime.parse(endDate.toString());
  var days = 0;
  if (kDebugMode) {
    print('======= TOTAL DAYS ==========');
    print(daysBetween(date1, date2));
    print('=============================');
  }
  days = daysBetween(date1, date2);
  if (days > 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => const HomeFeedScreen(),
        builder: (context) => TravelDetailsTwoScreen(
          strTravelTitle: title.toString(),
          strTravelYouFrom: youFrom.toString(),
          strTravelGoingTo: goingTo.toString(),
          strTravelStartDate: startDate.toString(),
          strTravelEndDate: endDate.toString(),
        ),
      ),
    );
  } else {
    final snackBar = SnackBar(
      content: text_bold_mons(
        //
        strCreateTravel_error_date,
        Colors.white,
        14.0,
      ),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
