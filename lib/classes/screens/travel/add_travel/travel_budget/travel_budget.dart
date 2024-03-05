// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_buddy_prefrences/travel_buddy_prefrences.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_food_prefrences/travel_food_prefrences.dart';

import '../../../../headers/utils/utils.dart';

class TravelBudgetScreen extends StatefulWidget {
  const TravelBudgetScreen({super.key});

  @override
  State<TravelBudgetScreen> createState() => _TravelBudgetScreenState();
}

class _TravelBudgetScreenState extends State<TravelBudgetScreen> {
  //
  bool? isCheckedAirbnb = false;
  bool? isCheckedHostel = false;
  bool? isCheckedHotel = false;
  bool? isCheckedDormitory = false;
  bool? isCheckedOther = false;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                    child: TextFormField(
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 24.0, right: 18.0),
              child: text_regular_mons(
                'Tell us about your whole trip budget so we will find your buddy accordingly. Cheers!!!',
                Colors.black,
                10.0,
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
                  'where you going to stay. \nIf you have any particular place in mind so please tell us or else skip this feature.',
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
                        '3/4 ',
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
