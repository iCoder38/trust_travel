import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_budget/travel_budget.dart';

import '../../../../headers/utils/utils.dart';

class TravelVehiclePrefrence extends StatefulWidget {
  const TravelVehiclePrefrence({super.key});

  @override
  State<TravelVehiclePrefrence> createState() => _TravelVehiclePrefrenceState();
}

class _TravelVehiclePrefrenceState extends State<TravelVehiclePrefrence> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
