import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../../../headers/utils/utils.dart';

class WidgetDescriptionUIKit extends StatefulWidget {
  const WidgetDescriptionUIKit({super.key, required this.strModeOfTravel});

  final String strModeOfTravel;

  @override
  State<WidgetDescriptionUIKit> createState() => _WidgetDescriptionUIKitState();
}

class _WidgetDescriptionUIKitState extends State<WidgetDescriptionUIKit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ReadMoreText(
        //
        widget.strModeOfTravel,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 12.0,
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
    ); /**/
  }
}
