// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:carousel_grid/carousel_grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../headers/utils/utils.dart';

class TravelDetailsScreen extends StatefulWidget {
  const TravelDetailsScreen({super.key, this.getFullDataFromTravel});

  final getFullDataFromTravel;

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
  //
  var strScreenLoader = true;
  //
  var strTravelDocumentId;
  var strTravelName = '';
  List<String> listOfAllImages = [];
  @override
  void initState() {
    if (kDebugMode) {
      print('==========================');
      // print(widget.getFullDataFromTravel);
      print('==========================');
    }
    getAndSaveData();
    super.initState();
  }

  getAndSaveData() {
    //
    strTravelDocumentId =
        widget.getFullDataFromTravel['document_id'].toString();
    strTravelName = widget.getFullDataFromTravel['travel_title'].toString();
    //
// all images
    for (int i = 0;
        i < widget.getFullDataFromTravel['place_photos'].length;
        i++) {
      //
      listOfAllImages.add(
        'https://maps.googleapis.com/maps/api/place/photo?maxwidth=5000&photoreference=${widget.getFullDataFromTravel['place_photos'][i]['refrence'].toString()}&key=$kGoogle_API_KEY',
      );
    }
    // print(listOfAllImages);
    // print(listOfAllImages);
    setState(() {
      strScreenLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWithRegularStyle(
          'Travel',
          16.0,
          Colors.black,
        ),
        leading: IconButton(
          onPressed: () {
            //
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: /*strScreenLoader == true
          ? const CircularProgressIndicator()
          : Center(
              child: text_regular_open(
                //
                strTravelDocumentId,
                Colors.black,
                12.0,
              ),
            ),*/
          Column(
        children: [
          CarouselGrid(
            height: 285,
            width: 400,
            listUrlImages: listOfAllImages,
            iconBack: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          //
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
            ),
            title: text_bold_poppins(
              //
              strTravelName,
              Colors.black,
              20.0,
            ),
            subtitle: text_regular_mons(
              'by: Dishant Rajput',
              Colors.black,
              10.0,
            ),
          )
        ],
      ),
    );
  }
}
