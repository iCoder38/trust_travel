import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class WidgetTravelGoingToUIKit extends StatefulWidget {
  const WidgetTravelGoingToUIKit(
      {super.key, required this.strGoingTo, required this.strPublicMode});

  final String strGoingTo;
  final String strPublicMode;

  @override
  State<WidgetTravelGoingToUIKit> createState() =>
      _WidgetTravelGoingToUIKitState();
}

class _WidgetTravelGoingToUIKitState extends State<WidgetTravelGoingToUIKit> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ReadMoreText(
        //
        '${widget.strGoingTo}, via ${widget.strPublicMode}',
        // allTravels['travel_going_to'] +
        //     ', via ' +
        //     allTravels['travel_public_mode'],
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 10.0,
        ),
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: '...Show more',
        trimExpandedText: '...Show less',
        moreStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.pinkAccent,
        ),
        lessStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }
}
