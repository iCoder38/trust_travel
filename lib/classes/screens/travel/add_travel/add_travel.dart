import 'package:country_state_city/utils/utils.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:trust_travel/classes/headers/utils/utils.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_details_two/travel_details_two.dart';
// import 'package:trust_travel/classes/screens/travel/add_travel/travel_budget/travel_budget.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_vehicle_prefrence/travel_vehicle_prefrence.dart';
import 'package:uuid/uuid.dart';

class AddTravelScreen extends StatefulWidget {
  const AddTravelScreen({super.key});

  @override
  State<AddTravelScreen> createState() => _AddTravelScreenState();
}

class _AddTravelScreenState extends State<AddTravelScreen> {
  //
  final formKey = GlobalKey<FormState>();
  var strScreenLoader = true;
  var strButtonLoader = false;
  bool? isChecked = true;
  var strSelectGender = '1';
  var uuid = const Uuid().v4();
  var arrAllStates = [];
  // all text fields
  late final TextEditingController contTripTitle;
  late final TextEditingController contYouFrom;
  late final TextEditingController contGoingTo;
  late final TextEditingController contStartDate;
  late final TextEditingController contEndDate;
  //
  @override
  void initState() {
    //
    getStateList();
    contTripTitle = TextEditingController();
    contYouFrom = TextEditingController();
    contGoingTo = TextEditingController();
    contStartDate = TextEditingController();
    contEndDate = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contTripTitle.dispose();
    contYouFrom.dispose();
    contGoingTo.dispose();
    contStartDate.dispose();
    contEndDate.dispose();
    super.dispose();
  }

  getStateList() async {
    //
    // Get all countries
    /*final countries = await getAllCountries();
    print(countries.first);*/

    final country = await getCountryFromCode('IN');
    if (country != null) {
      final countryStates = await getStatesOfCountry(country.isoCode);
      for (int i = 0; i < countryStates.length; i++) {
        if (kDebugMode) {
          print(countryStates[i].name);
          print(countryStates[i].latitude);
          print(countryStates[i].longitude);
          print(countryStates[i].countryCode);
          print(countryStates[i].isoCode);

          //
          // final countryCitis = await getCountryCities(countryStates[0].isoCode);
          // print(countryCitis[0].name);
          print('=========================');
        }
        arrAllStates.add(countryStates[i].name);
      }

      setState(() {
        strScreenLoader = false;
      });

      //
      // final countryCitis = await getCountryCities(country.isoCode);
      //
      /*final countryCitis = await getCountryCities('UP');
      for (int i = 0; i < countryCitis.length; i++) {
        if (kDebugMode) {
          print('enter');
          print(countryCitis[i].name);
        }
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWithRegularStyle('Create', 16.0, Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: strScreenLoader == true
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: text_regular_mons(
                        'We will help you to find your best travel buddy .Cheers!!!',
                        Colors.black,
                        12.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: text_field_header(
                          'Title',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                      child: TextFormField(
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        controller: contTripTitle,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 14,
                          ),
                          hintText: 'ex. Chalo Kasol...',
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
                    //

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: text_field_header(
                          'You from ?',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                      child: TextFormField(
                        readOnly: true,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        controller: contYouFrom,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 14,
                          ),
                          hintText: 'ex. Delhi',
                        ),
                        maxLines: 1,
                        // maxLength: 25,
                        onTap: () {
                          //
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      shrinkWrap: false,
                                      itemCount: arrAllStates.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          // leading: const Icon(Icons.list),
                                          // trailing: text,
                                          title: text_regular_poppins(
                                            //
                                            arrAllStates[index],
                                            Colors.black,
                                            14.0,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              contYouFrom.text =
                                                  arrAllStates[index]
                                                      .toString();
                                            });
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    ),
                                    /*Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'data',
                                        ),
                                      ],
                                    ),*/
                                  ),
                                );
                              });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: text_field_header(
                          'Going to ?',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                      child: TextFormField(
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        controller: contGoingTo,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 14,
                          ),
                          hintText: 'ex. Himachal pradesh',
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
                    const SizedBox(
                      height: 20.0,
                    ), // const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: text_field_header(
                          'Dates',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 24.0, left: 24.0),
                            child: TextFormField(
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              readOnly: true,
                              controller: contStartDate,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Start date',
                                hintStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: 14,
                                ),
                                /*hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),*/
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  size: 18.0,
                                ),
                              ),
                              maxLines: 1,
                              // maxLength: 25,
                              onTap: () async {
                                DateTime? startPickedDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100));
                                if (startPickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(startPickedDate);
                                  setState(() {
                                    contStartDate.text = formattedDate;
                                  });
                                }
                              },
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
                            padding:
                                const EdgeInsets.only(right: 24.0, left: 24.0),
                            child: TextFormField(
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              readOnly: true,
                              controller: contEndDate,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: 14,
                                ),
                                hintText: 'End date',
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  size: 18.0,
                                ),
                              ),
                              maxLines: 1,
                              // maxLength: 25,
                              onTap: () async {
                                DateTime? startPickedDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100));
                                if (startPickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(startPickedDate);
                                  setState(() {
                                    contEndDate.text = formattedDate;
                                  });
                                }
                              },
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
                    const SizedBox(
                      height: 20.0,
                    ), // const Divider(),
                    /*Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: text_field_header(
                    'Number of days',
                  ),
                ),
              ),*/
                    /*Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: TextFormField(
                  controller: textYourName,
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
                    hintText: 'Number of days',
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
              ),*/
                    // const SizedBox(
                    //   height: 30.0,
                    // ),
                    // const Divider(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          strButtonLoader = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => const HomeFeedScreen(),
                            builder: (context) =>
                                const TravelDetailsTwoScreen(),
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
                          child: strButtonLoader == true
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 0.4,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text_bold_mons(
                                      'Next ',
                                      Colors.white,
                                      18.0,
                                    ),
                                    text_regular_mons(
                                      '1/4 ',
                                      Colors.white,
                                      12.0,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    /*const SizedBox(
                height: 30.0,
              ),
              const Divider(),
          
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: text_bold_open(
                    'Travel Preferences',
                    Colors.pinkAccent,
                    26.0,
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 24.0),
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
              /*Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: text_regular_mons(
                    'If you are using your private vehicle so please mention Private Vechile with sitting capacity. ( ex. Private Vehicle 4 seater )',
                    Colors.black,
                    10.0,
                  ),
                ),
              ),*/
              isChecked == true
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                          child: TextFormField(
                            controller: textYourName,
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
                            controller: textYourName,
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
                            controller: textYourName,
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
                        controller: textYourName,
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
                    ),*/
                  ],
                ),
              ),
            ),
    );
  }
}
