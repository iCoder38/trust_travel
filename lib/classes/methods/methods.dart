/* ////////////////////////////////////////////////////////////////// */
/* ////////////////////// create event ////////////////////// */
import 'dart:math';

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
  allPhotos,
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
          getArrAllPhotos: allPhotos,
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
///////////////////////////////// TRAVEL LIST //////////////////////////////////
///////////////////////// TRAVEL LIST DATE COMPARISION /////////////////////////
compareDates(getStartDate, getEndDate) {
  //
  // user current date
  //////////////// CURRENT DATE ////////////
  var getUserCurrentDate = getCurrentDate();
  ////////////// START DATE ////////////////
  DateTime startDate = DateTime.parse(getStartDate);
  ////////////// END DATE //////////////////
  DateTime endDate = DateTime.parse(getEndDate);
  DateTime userCurrentDate = DateTime.parse(getUserCurrentDate);
  /////////////////////////////////////////////
  /*if (kDebugMode) {
    print(startDate);
    // print(userCurrentDate);
    print(endDate);
  }*/
  // var strTimeStatusMoment = '0';
  // compare start date with current date
  if (startDate.compareTo(userCurrentDate) == 0) {
    // strTimeStatusMoment = 'same time';
    return 'last day';
  }
  //
  if (startDate.compareTo(userCurrentDate) < 0) {
    if (kDebugMode) {
      print('start date is lower then current date');
    }
    // but end date should be lower then current date
    if (endDate.compareTo(userCurrentDate) < 0) {
      if (kDebugMode) {
        print('end date is lower then current date');
      }
      if (kDebugMode) {
        print('start and end date both are lower');
      }
      return 'expired';
    } else {
      if (kDebugMode) {
        print('end date is greater then current date');
      }
      return 'on-going';
    }
  } else {
    return 'upcoming';
  }

  /*if (startDate.compareTo(userCurrentDate) < 0) {
    strTimeStatusMoment = 'start date is before current ';
    return 'expired';
  }
  //
  if (startDate.compareTo(userCurrentDate) > 0) {
    strTimeStatusMoment = 'start after current ';
    //
    if (userCurrentDate.compareTo(endDate) < 0) {
      if (kDebugMode) {
        print('CURRENT DATE IS SMALLER then END DATE');
      }
    }
    return strTimeStatusMoment;
  }*/
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// SPLIT DATES //////////////////////////////
String splitMethods(
  startDate,
  endDate,
) {
  var startDateIs = startDate.toString();
  var endDateIs = endDate.toString();
  // start date
  var splitStart = startDateIs.split('-');
  if (kDebugMode) {
    print(splitStart[0]);
    print(splitStart[1]);
    print(splitStart[2]);
  }

  // end date
  var splitEnd = endDateIs.split('-');
  if (kDebugMode) {
    print(splitEnd[0]);
    print(splitEnd[1]);
    print(splitEnd[2]);
  }

  var mergeDate = '0';
  mergeDate =
      '${splitStart[2]}-${splitStart[1]} ~ ${splitEnd[2]}-${splitEnd[1]}';

  return mergeDate;
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// GENERATE NUMBER //////////////////////////
int randomNumber() {
  return Random().nextInt(9);
}
