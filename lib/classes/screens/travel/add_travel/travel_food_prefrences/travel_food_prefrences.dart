import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../headers/utils/utils.dart';

class TravelFoodPrefrencesScreen extends StatefulWidget {
  const TravelFoodPrefrencesScreen({super.key});

  @override
  State<TravelFoodPrefrencesScreen> createState() =>
      _TravelFoodPrefrencesScreenState();
}

class _TravelFoodPrefrencesScreenState
    extends State<TravelFoodPrefrencesScreen> {
  //
  bool? isCheckedSmokeYes = false;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: text_bold_open(
              'Basic Info',
              const Color.fromARGB(200, 0, 0, 0),
              26.0,
            ),
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
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  //fillColor: Colors.blue,
                  value: isCheckedSmokeYes,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedSmokeYes = value!;
                      //
                      // isCheckedOther = false;
                    });
                  },
                ),
                isCheckedSmokeYes == true
                    ? text_bold_mons(
                        'Yes',
                        Colors.black,
                        14.0,
                      )
                    : text_regular_mons(
                        'Yes',
                        Colors.black,
                        14.0,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
