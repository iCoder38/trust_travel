import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../headers/utils/utils.dart';
import '../../../../methods/methods.dart';

class WidgetTravelDatesUIKit extends StatefulWidget {
  const WidgetTravelDatesUIKit(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.numberOfDays});

  final String startDate;
  final String endDate;
  final String numberOfDays;

  @override
  State<WidgetTravelDatesUIKit> createState() => _WidgetTravelDatesUIKitState();
}

class _WidgetTravelDatesUIKitState extends State<WidgetTravelDatesUIKit> {
  @override
  Widget build(BuildContext context) {
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
            child: Row(
              children: [
                text_regular_poppins(
                  //
                  splitMethods(widget.startDate, widget.endDate),
                  //
                  Colors.black,
                  10.0,
                ),
                text_bold_poppins(
                  //
                  ' [${widget.numberOfDays} days]',
                  Colors.black,
                  10.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
