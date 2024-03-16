// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../headers/utils/utils.dart';
import '../../details/travel_details.dart';
import 'travel_compare_dates.dart';
import 'travel_dates.dart';
import 'travel_going_to.dart';

class WidgetTravelUIKit extends StatefulWidget {
  const WidgetTravelUIKit({super.key, this.allTravels});

  final allTravels;

  @override
  State<WidgetTravelUIKit> createState() => _WidgetTravelUIKitState();
}

class _WidgetTravelUIKitState extends State<WidgetTravelUIKit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  //
                  SizedBox(
                    height: 180,
                    width: MediaQuery.of(context).size.width - 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://maps.googleapis.com/maps/api/place/photo?maxwidth=5000&photoreference=${widget.allTravels['place_photos'][Random().nextInt(9)]['refrence'].toString()}&key=$kGoogle_API_KEY',
                        fit: BoxFit.cover,
                        // memCacheHeight: 120,
                        // memCacheWidth: 140,
                        placeholder: (context, url) => SizedBox(
                          height: 40,
                          width: 40,
                          child: ShimmerLoader(
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  ListTile(
                    title: text_bold_poppins(
                      //
                      widget.allTravels['travel_title'],
                      Colors.black,
                      18.0,
                    ),
                    subtitle: Column(
                      children: [
                        //
                        WidgetTravelGoingToUIKit(
                          strGoingTo: widget.allTravels['travel_going_to'],
                          strPublicMode:
                              widget.allTravels['travel_public_mode'],
                        ),
                        //
                        WidgetTravelDatesUIKit(
                          startDate: widget.allTravels['travel_start_date'],
                          endDate: widget.allTravels['travel_end_date'],
                          numberOfDays:
                              widget.allTravels['travel_number_of_days'],
                        )
                      ],
                    ),
                    trailing: WidgetTravelCompareDatesUIKit(
                      startDate: widget.allTravels['travel_start_date'],
                      endDate: widget.allTravels['travel_end_date'],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
