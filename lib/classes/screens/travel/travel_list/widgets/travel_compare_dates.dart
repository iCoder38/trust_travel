import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../headers/utils/utils.dart';
import '../../../../methods/methods.dart';

class WidgetTravelCompareDatesUIKit extends StatefulWidget {
  const WidgetTravelCompareDatesUIKit(
      {super.key, required this.startDate, required this.endDate});

  final String startDate;
  final String endDate;

  @override
  State<WidgetTravelCompareDatesUIKit> createState() =>
      _WidgetTravelCompareDatesUIKitState();
}

class _WidgetTravelCompareDatesUIKitState
    extends State<WidgetTravelCompareDatesUIKit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text_regular_poppins(
          '2.3k Members',
          Colors.black,
          12.0,
        ),
        if (compareDates(
              widget.startDate,
              widget.endDate,
            ) ==
            'on-going') ...[
          text_regular_mons(
            compareDates(
              widget.startDate,
              widget.endDate,
            ),
            const Color.fromARGB(255, 231, 56, 3),
            12.0,
          ),
        ] else if (compareDates(
              widget.startDate,
              widget.endDate,
            ) ==
            'expired') ...[
          text_regular_mons(
            compareDates(
              widget.startDate,
              widget.endDate,
            ),
            const Color.fromARGB(255, 247, 18, 1),
            12.0,
          ),
        ] else if (compareDates(
              widget.startDate,
              widget.endDate,
            ) ==
            'upcoming') ...[
          text_regular_mons(
            compareDates(
              widget.startDate,
              widget.endDate,
            ),
            Colors.green,
            12.0,
          ),
        ] else if (compareDates(
              widget.startDate,
              widget.endDate,
            ) ==
            'last day') ...[
          text_bold_mons(
            compareDates(
              widget.startDate,
              widget.endDate,
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
