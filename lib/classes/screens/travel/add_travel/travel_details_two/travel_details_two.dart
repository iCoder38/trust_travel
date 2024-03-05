// import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_buddy_prefrences/travel_buddy_prefrences.dart';

import '../../../../headers/utils/utils.dart';
// import '../travel_budget/travel_budget.dart';

class TravelDetailsTwoScreen extends StatefulWidget {
  const TravelDetailsTwoScreen({super.key});

  @override
  State<TravelDetailsTwoScreen> createState() => _TravelDetailsTwoScreenState();
}

class _TravelDetailsTwoScreenState extends State<TravelDetailsTwoScreen> {
  var strScreenLoader = true;
  bool? isChecked = false;
  // accomodations click
  bool? isCheckedAirbnb = false;
  bool? isCheckedHostel = false;
  bool? isCheckedHotel = false;
  bool? isCheckedDormitory = false;
  bool? isCheckedOther = false;
  // all text fields
  late final TextEditingController contPrivateCarName;
  late final TextEditingController contPrivateCarSeat;
  late final TextEditingController contPrivateCarGasCharge;
  late final TextEditingController contBudgetMinimum;
  late final TextEditingController contBudgetMaximum;
  late final TextEditingController contStayAirbnb;
  late final TextEditingController contStayHostel;
  late final TextEditingController contStayDormitory;
  late final TextEditingController contStayOther;
  //
  var arrAllOfStays = [];
  @override
  void initState() {
    //
    allTypeOfStays();
    super.initState();
  }

  allTypeOfStays() {
    //
    arrAllOfStays = [
      {
        'name': 'Airbnb',
        'status': '0',
      },
      {
        'name': 'Hostel',
        'status': '0',
      },
      {
        'name': 'Hotel',
        'status': '0',
      },
      {
        'name': 'Apartment',
        'status': '0',
      },
      {
        'name': 'Botique',
        'status': '0',
      },
      {
        'name': 'Guest House',
        'status': '0',
      },
      {
        'name': 'Campsite',
        'status': '0',
      },
      {
        'name': 'Villa',
        'status': '0',
      },
      {
        'name': 'Cottage',
        'status': '0',
      },
      {
        'name': 'Resort',
        'status': '0',
      },
      {
        'name': 'Homestays',
        'status': '0',
      },
      {
        'name': 'Suits',
        'status': '0',
      },
      {
        'name': 'Bunglow',
        'status': '0',
      }
    ];

    if (kDebugMode) {
      print(arrAllOfStays);
    }
    setState(() {
      strScreenLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: strScreenLoader == true
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text_field_header(
                        'Mode of travel',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: Colors.blue,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        text_regular_mons(
                          'Private Vehicle',
                          Colors.black,
                          14.0,
                        )
                      ],
                    ),
                  ),
                  isChecked == true
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 24.0, left: 24.0),
                              child: TextFormField(
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                // controller: textYourName,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  // border: InputBorder.none,

                                  // border: OutlineInputBorder(),
                                  // labelText: 'Name',
                                  hintText: 'vehicle name',
                                ),
                                maxLines: 1,
                                // maxLength: 25,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, right: 24.0, left: 24.0),
                              child: TextFormField(
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                // controller: textYourName,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  // border: InputBorder.none,

                                  // border: OutlineInputBorder(),
                                  // labelText: 'Name',
                                  hintText: 'seat capacity',
                                ),
                                maxLines: 1,
                                // maxLength: 25,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, right: 24.0, left: 24.0),
                              child: TextFormField(
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                // controller: textYourName,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  // border: InputBorder.none,

                                  // border: OutlineInputBorder(),
                                  // labelText: 'Name',
                                  hintText: 'Gas charges per person in INR',
                                ),
                                maxLines: 1,
                                // maxLength: 25,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(right: 24.0, left: 24.0),
                          child: TextFormField(
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            // controller: textYourName,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              // border: InputBorder.none,
                              // border: OutlineInputBorder(),
                              // labelText: 'Name',
                              hintText: 'Mode ( Bus, Train )',
                            ),
                            maxLines: 1,
                            // maxLength: 25,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: text_bold_open(
                          'Budget',
                          const Color.fromARGB(200, 0, 0, 0),
                          26.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 24.0, right: 18.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text_regular_mons(
                        'You can tell us about your budget. ( min and max ). So we will filter your buddies accordingly.',
                        Colors.black,
                        10.0,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 24.0, left: 24.0),
                          child: TextFormField(
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            // controller: textYourName,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: 'Minimum',
                            ),
                            maxLines: 1,
                            // maxLength: 25,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 24.0, left: 24.0),
                          child: TextFormField(
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            // controller: textYourName,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              // border: InputBorder.none,

                              // border: OutlineInputBorder(),
                              // labelText: 'Name',
                              hintText: 'maximum',
                            ),
                            maxLines: 1,
                            // maxLength: 25,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: text_bold_open(
                          'Stay',
                          const Color.fromARGB(200, 0, 0, 0),
                          26.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 24.0, right: 18.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text_regular_mons(
                        'where you going to stay. \nIf you have any particular place in mind so please let us know.',
                        Colors.black,
                        10.0,
                      ),
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: Colors.blue,
                          value: isCheckedAirbnb,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedAirbnb = value!;
                              //
                              isCheckedOther = false;
                            });
                          },
                        ),
                        isCheckedAirbnb == true
                            ? text_bold_mons(
                                'Airbnb',
                                Colors.black,
                                14.0,
                              )
                            : text_regular_mons(
                                'Airbnb',
                                Colors.black,
                                14.0,
                              )
                      ],
                    ),
                  ),*/
                  //hotel
                  Column(
                    children: [
                      for (int i = 0; i < arrAllOfStays.length; i++) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 18.0),
                          child: Row(
                            children: [
                              /*Checkbox(
                                checkColor: Colors.white,
                                //fillColor: Colors.blue,
                                value: isCheckedHotel,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedHotel = value!; //
                                    isCheckedOther = false;
                                  });
                                },
                              ),*/
                              GestureDetector(
                                onTap: () {
                                  //
                                  if (kDebugMode) {
                                    print(i);
                                  }
                                  //
                                  var strName =
                                      arrAllOfStays[i]['name'].toString();
                                  var strTick =
                                      arrAllOfStays[i]['status'].toString();
                                  // print(strName);
                                  // print(strTick);
                                  //
                                  // remove from array
                                  arrAllOfStays.removeAt(i);
                                  //
                                  // insert
                                  if (strTick == '0') {
                                    var newData = {
                                      'name': strName.toString(),
                                      'status': '1'.toString(),
                                    };
                                    arrAllOfStays.insert(i, newData);
                                    // print(arrAllOfStays);
                                  } else {
                                    var newData = {
                                      'name': strName.toString(),
                                      'status': '0'.toString(),
                                    };
                                    arrAllOfStays.insert(i, newData);
                                    // print(arrAllOfStays);
                                  }
                                  setState(() {});
                                },
                                child: (arrAllOfStays[i]['status'].toString() ==
                                        '0'.toString())
                                    ? text_regular_mons(
                                        //
                                        arrAllOfStays[i]['name'].toString(),
                                        Colors.black,
                                        16.0,
                                      )
                                    : Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          text_bold_mons(
                                            //
                                            arrAllOfStays[i]['name'].toString(),
                                            Colors.black,
                                            16.0,
                                          ),
                                          const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ]
                    ],
                  ),

                  // hostel
                  /*Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: Colors.blue,
                          value: isCheckedHostel,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedHostel = value!; //
                              isCheckedOther = false;
                            });
                          },
                        ),
                        isCheckedHostel == true
                            ? text_bold_mons(
                                'Hostel',
                                Colors.black,
                                14.0,
                              )
                            : text_regular_mons(
                                'Hostel',
                                Colors.black,
                                14.0,
                              )
                      ],
                    ),
                  ),
                  // dormitory
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: Colors.blue,
                          value: isCheckedDormitory,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedDormitory = value!; //
                              isCheckedOther = false;
                            });
                          },
                        ),
                        isCheckedDormitory == true
                            ? text_bold_mons(
                                'Dormitory',
                                Colors.black,
                                14.0,
                              )
                            : text_regular_mons(
                                'Dormitory',
                                Colors.black,
                                14.0,
                              )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: Colors.blue,
                          value: isCheckedOther,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedOther = value!;
                              //
                              isCheckedAirbnb = false;
                              isCheckedHotel = false;
                              isCheckedHostel = false;
                              isCheckedDormitory = false;
                            });
                          },
                        ),
                        isCheckedOther == true
                            ? text_bold_mons(
                                'Other',
                                Colors.black,
                                14.0,
                              )
                            : text_regular_mons(
                                'Other',
                                Colors.black,
                                14.0,
                              )
                      ],
                    ),
                  ),
                  isCheckedOther == false
                      ? const SizedBox(
                          height: 0,
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(right: 24.0, left: 24.0),
                          child: TextFormField(
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            // controller: textYourName,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              // border: InputBorder.none,

                              // border: OutlineInputBorder(),
                              // labelText: 'Name',
                              hintText: 'place name',
                            ),
                            maxLines: 1,
                            // maxLength: 25,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),*/
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => const HomeFeedScreen(),
                          builder: (context) =>
                              const TravelBuddyPrefrencesScreen(),
                        ),
                      );
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
                              '2/4 ',
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
      ),
    );
  }
}
