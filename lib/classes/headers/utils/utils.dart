// ignore_for_file: non_constant_identifier_names, unused_local_variable, constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
//
import 'package:jiffy/jiffy.dart';
import 'package:shimmer/shimmer.dart';

import '../../screens/travel/add_travel/travel_details_two/travel_details_two.dart';
//

/* ========================FIREBASE MODE ======================== */ //
// TEST
// test : user
var user = 'test_members/';
//
const kGoogleApiKey = "AIzaSyDK7pJq7eqwA7IGthgXlg2mEJmvC-WLVlE";
//
// /******************************************************************/
// /********************* STORAGE ************************************/
// const String FIREBASE_STORAGE_BUCKET_NAME = 'Live_Storage';
const String FIREBASE_STORAGE_BUCKET_NAME = 'Test_Storage';
// /******************************************************************/
// /********************* STORAGE : EVENT ****************************/
String EVENT_STORAGE = '$FIREBASE_STORAGE_BUCKET_NAME/events';
// /******************************************************************/
// /********************* STORAGE : EVENT MEDIA **********************/
String EVENT_MEDIA_STORAGE = '$FIREBASE_STORAGE_BUCKET_NAME/events_media';
// /******************************************************************/
// /************** GOOGLE KEY ****************************************/
var kGoogle_API_KEY = 'AIzaSyAULQHYzpkutmeYPo9nU3BIGTlFlw9ZuH8';
// /******************************************************************/
// /******************************************************************/
// LIVE
// live : user
// var user = 'members';
//
//
// const String FIREBASE_STORAGE_BUCKET_NAME = 'Dev-Synapse-Bucket';
const String FIREBASE_STORAGE_COMMUNITY_URL =
    '$FIREBASE_STORAGE_BUCKET_NAME/public/communities/';
//
const String FIREBASE_STORAGE_ALL_PROFILE_PICTURES =
    '$FIREBASE_STORAGE_BUCKET_NAME/public/profile_picture/';
//

const String FIREBASE_STORAGE_EVENT_URL =
    '$FIREBASE_STORAGE_BUCKET_NAME/public/events/';
const String FIREBASE_STORAGE_EVENT_MEDIA_URL =
    '$FIREBASE_STORAGE_BUCKET_NAME/public/events_media';
/* ================================================================ */
var dummy_image_url =
    'https://images.unsplash.com/photo-1520820446914-04cb9819a6cc?auto=format&fit=crop&q=80&w=2936&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
/* ======================== TEXT ======================== */ //
var str_alert_please_wait = 'Please wait...';
var strActivateYourFeedMessage =
    'This feed will be activated again and visible to everyone.';
var strDeactivateYourFeedMessage =
    'This post will be deactivated and hide it from everywhere. If you want to activate it again so activate it from your profile';
//
var strCreateTravel_error_date = "Start date should be greater then end date";
var strCreateTravel_error_stay = "Please select atleast one stay";
var strCreateTravel_error_budget =
    "Minimum budget should be less then Maximum budget";
/* ======================== COLOR ================ */ //
var select_color = Colors.redAccent;
/* ======================== ALERT MESSAGE ================ */ //
//
var str_error_email_already_exist =
    'The account already exists for that email.';
var str_error_weak_password = 'The password provided is too weak.';
//
var str_password_length_eight = 'Password must be 8 character or more';
//
var str_invalid_login_details =
    'Invalid Credentials. Please check and try again.';
//
/* =================== RETURN ERRORS MESSAGES ============ */ //
func_handle_error(error_type) {
  //
  var error_message = '';
  if (error_type == '1') {
    error_message = str_error_weak_password;
  } else if (error_type == '2') {
    error_message = str_error_email_already_exist;
  } else if (error_type == '3') {
    error_message = str_invalid_login_details;
  } else if (error_type == 'password_length_eight') {
    error_message = str_password_length_eight;
  }

  return error_message;
}

/* ================================================================ */
/* ========== CONVERT TOTAL NUMBER OF DAYS ======================== */
int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
/* ================================================================ */
/* ========== CONVERT TIMESTAMP TO DATE AND TIME =============== */

funcConvertTimeStampToDateAndTimeOldMethod(getTimeStamp) {
  var dt = DateTime.fromMillisecondsSinceEpoch(getTimeStamp);
  var d12HourFormatDateAndTimeboth =
      DateFormat('dd / MMMM / yyyy , hh:mm a').format(dt);
  // var d12HourFormatTime = DateFormat('hh:mm a').format(dt);
  return d12HourFormatDateAndTimeboth;
}

compareEventExpireData(dateIs) {
  DateTime dt1 = DateTime.parse(dateIs);
  DateTime dt2 = DateTime.now();

  var strMessage = '';
  if (dt1.compareTo(dt2) == 0) {
    // if (kDebugMode) {
    //   print("Both date time are at same moment.");
    // }
    strMessage = '3'; // same day
  }

  if (dt1.compareTo(dt2) < 0) {
    // if (kDebugMode) {
    //   print("DT1 is before DT2");
    // }
    strMessage = '1'; // expired
  }

  if (dt1.compareTo(dt2) > 0) {
    // if (kDebugMode) {
    //   print("DT1 is after DT2");
    // }
    strMessage = '2'; // ongoing
  }
  return strMessage;
}

/* ================================================================ */
/* ========== CURRENT TIME WITH CUSTOM FORMATTER =============== */
getCurrentDate() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  if (kDebugMode) {
    print(formattedDate);
  }
  return formattedDate;
}
/* ================================================================ */
/* ========== CONVERT TIMESTAMP TO DATE AND TIME =============== */

funcConvertTimeStampToDateAndTimeForChat(getTimeStamp) {
  var dt = DateTime.fromMillisecondsSinceEpoch(getTimeStamp);
  // var d12HourFormat = DateFormat('dd/MM/yyyy, hh:mm').format(dt);
  var d12HourFormatDateAndTimeboth = DateFormat('yyyy/MM/dd').format(dt);
  // var d12HourFormatTime = DateFormat('hh:mm a').format(dt);
// Jiffy.parse(string)
  DateTime now = DateTime.now();
  // print('now');
  // print(d12HourFormatDateAndTimeboth);
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  String formattedDate = DateFormat('yyyy/MM/dd').format(now);
  /*if (kDebugMode) {
    print('today ==> $formattedDate');
  }*/
  // compare time stamp with today's date
  var compare = Jiffy.parse(formattedDate)
      .isSame(Jiffy.parse(d12HourFormatDateAndTimeboth));

  if (compare == true) {
    return 'today';
  } else {
    // 1
    /*var d12HourFormatDateAndTimeboth2 =
        DateFormat('yyyy - MMM - dd, hh:mm').format(dt);
    return d12HourFormatDateAndTimeboth2;*/
    // 2
    var d12HourFormatDateAndTimeboth2 = DateFormat('yyyy/MM/dd').format(dt);
    var pastDate = Jiffy.parse(d12HourFormatDateAndTimeboth2)
        .from(Jiffy.parse(formattedDate));
    return pastDate;
    // return compare;
  }

  // Jiffy.parse(d12HourFormatDateAndTimeboth).fromNow();
  // return d12HourFormatDateAndTimeboth;
}

/* ================================================================ */
/* ========== DATE , TIME for CHAT ================================ */

convertTimeAndStampForChat(getTimeStamp) {
  var dt = DateTime.fromMillisecondsSinceEpoch(getTimeStamp);
  // var d12HourFormat = DateFormat('dd/MM/yyyy, hh:mm').format(dt);
  var d12HourFormatDateAndTimeboth = DateFormat('hh:mm a').format(dt);
  // var d12HourFormatTime = DateFormat('hh:mm a').format(dt);
  return d12HourFormatDateAndTimeboth;
}

funcConvertTimeStampToDateAndTime(DateTime d) {
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365) {
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  }
  if (diff.inDays > 30) {
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  }
  if (diff.inDays > 7) {
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  }
  if (diff.inDays > 0) return DateFormat.E().add_jm().format(d);
  if (diff.inHours > 0) return "Today ${DateFormat('jm').format(d)}";
  if (diff.inMinutes > 0) {
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  }
  return "just now";
}

//
String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('dd / MMMM / yyyy , HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = '${diff.inDays} DAY AGO';
    } else {
      time = '${diff.inDays} DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = '${(diff.inDays / 7).floor()} WEEK AGO';
    } else {
      time = '${(diff.inDays / 7).floor()} WEEKS AGO';
    }
  }

  return time;
}

//
/* ====================== TEXT STYLE =================== */ //
// open sans regular

text_field_header(text) {
  return text_bold_open(
    text,
    Colors.black,
    26.0,
  );
}

Text text_regular_mons(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.montserrat(
      color: color,
      fontSize: size,
    ),
  );
}

// open sans  bold
Text text_bold_mons(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

// open sans regular
Text text_regular_open(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.openSans(
      color: color,
      fontSize: size,
    ),
  );
} // open sans  bold

Text text_bold_open(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.openSans(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

//
// open sans regular
Text text_regular_poppins(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.poppins(
      color: color,
      fontSize: size,
    ),
  );
} // open sans  bold

Text text_bold_poppins(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}
//
// open sans  bold
/*Text text_bold_comforta(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.openSans(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

// comforta regular
Text text_regular_comforta(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.comfortaa(
      color: color,
      fontSize: size,
    ),
  );
}

// comforta bold
Text text_bold_comforta(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.comfortaa(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

// comforta bold
Text text_bold_comfortaa(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.comfortaa(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

// roboto regular
Text text_regular_roboto(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.roboto(
      color: color,
      fontSize: size,
    ),
  );
}

// roboto bold
Text text_bold_roboto(str, color, size) {
  return Text(
    str.toString(),
    style: GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
  //
}*/

Text textWithRegularStyle(str, textSize, textColor) {
  return Text(
    str.toString(),
    // textAlign: TextAlign.right,
    style: GoogleFonts.poppins(
      fontSize: textSize,
      color: textColor,
    ),
  );
}

Text textWithSemiBoldStyle(str, textSize, textColor) {
  return Text(
    str.toString(),
    style: GoogleFonts.poppins(
      fontSize: textSize,
      fontWeight: FontWeight.w700,
      color: textColor,
    ),
  );
}

ShimmerLoader(
    {required double width,
    double? height,
    Color? color,
    Decoration? decoration}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      decoration: decoration,
      width: width,
      height: height ?? 10,
      color: color ?? Colors.white,
    ),
  );
}
