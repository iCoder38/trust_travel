import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../headers/utils/utils.dart';
import '../travel_budget/travel_budget.dart';

class TravelDetailsTwoScreen extends StatefulWidget {
  const TravelDetailsTwoScreen({super.key});

  @override
  State<TravelDetailsTwoScreen> createState() => _TravelDetailsTwoScreenState();
}

class _TravelDetailsTwoScreenState extends State<TravelDetailsTwoScreen> {
  bool? isChecked = false;
  // accomodations click
  bool? isCheckedAirbnb = false;
  bool? isCheckedHostel = false;
  bool? isCheckedHotel = false;
  bool? isCheckedDormitory = false;
  bool? isCheckedOther = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                        padding: const EdgeInsets.only(right: 24.0, left: 24.0),
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
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
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
              padding: const EdgeInsets.only(top: 10, left: 24.0, right: 18.0),
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
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
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
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
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
              padding: const EdgeInsets.only(top: 10, left: 24.0, right: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: text_regular_mons(
                  'where you going to stay. \nIf you have any particular place in mind so please let us know.',
                  Colors.black,
                  10.0,
                ),
              ),
            ),
            Padding(
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
            ),
            //hotel
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    //fillColor: Colors.blue,
                    value: isCheckedHotel,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedHotel = value!; //
                        isCheckedOther = false;
                      });
                    },
                  ),
                  isCheckedHotel == true
                      ? text_bold_mons(
                          'Hotel',
                          Colors.black,
                          14.0,
                        )
                      : text_regular_mons(
                          'Hotel',
                          Colors.black,
                          14.0,
                        )
                ],
              ),
            ),
            // hostel
            Padding(
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
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
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
                  ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => const HomeFeedScreen(),
                    builder: (context) => const TravelBudgetScreen(),
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
