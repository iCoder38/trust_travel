// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:carousel_grid/carousel_grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:trust_travel/classes/screens/travel/details/widgets/description.dart';
import 'package:trust_travel/classes/screens/travel/details/widgets/mode_of_travel.dart';

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
  var strModeOfTravel = '';
  //
  var strModeVehicleName = '';
  var strModeVehicleGas = '';
  var strModeVehicleSeat = '';
  //
  List<String> listOfAllImages = [];
  @override
  void initState() {
    getAndSaveData();
    super.initState();
  }

  getAndSaveData() {
    //
    /*print('========= CHECK 1 ===========');
    print(widget.getFullDataFromTravel);*/
    strTravelDocumentId =
        widget.getFullDataFromTravel['document_id'].toString();
    /*if (kDebugMode) {
      print('========= CHECK ===========');
      print(strTravelDocumentId);
      print('===========================');
    }*/
    strTravelName = widget.getFullDataFromTravel['travel_title'].toString();
    strModeOfTravel =
        widget.getFullDataFromTravel['travel_public_mode'].toString();
    strModeVehicleName =
        widget.getFullDataFromTravel['travel_vehicle_name'].toString();
    strModeVehicleGas =
        widget.getFullDataFromTravel['travel_vehicle_gas'].toString();
    strModeVehicleSeat =
        widget.getFullDataFromTravel['travel_vehicle_seat'].toString();
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
      body: strScreenLoader == true
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(
                          20.0,
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
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                  WidgetModeOfTravelUIKit(
                    strMode: strModeOfTravel,
                    strVehicleName: strModeVehicleName,
                    strVehicleGas: strModeVehicleGas,
                    strVehicleSeat: strModeVehicleSeat,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 1,
                    ),
                  ),

                  const WidgetDescriptionUIKit(
                    strModeOfTravel:
                        'qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty ',
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
