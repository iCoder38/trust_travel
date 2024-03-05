// import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/travel_buddy_prefrences/travel_buddy_prefrences.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../headers/utils/utils.dart';

// import '../travel_budget/travel_budget.dart';
class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class TravelDetailsTwoScreen extends StatefulWidget {
  const TravelDetailsTwoScreen(
      {super.key,
      required this.strTravelTitle,
      required this.strTravelYouFrom,
      required this.strTravelGoingTo,
      required this.strTravelStartDate,
      required this.strTravelEndDate});

  final String strTravelTitle;
  final String strTravelYouFrom;
  final String strTravelGoingTo;
  final String strTravelStartDate;
  final String strTravelEndDate;

  @override
  State<TravelDetailsTwoScreen> createState() => _TravelDetailsTwoScreenState();
}

class _TravelDetailsTwoScreenState extends State<TravelDetailsTwoScreen> {
  //

  final formKey = GlobalKey<FormState>();
  var strTotalNumbersOfDays = '0';
  var strScreenLoader = true;
  bool? isChecked = false;
  // accomodations click
  bool? isCheckedAirbnb = false;
  bool? isCheckedHostel = false;
  bool? isCheckedHotel = false;
  bool? isCheckedDormitory = false;
  bool? isCheckedOther = false;
  // all text fields
  late final TextEditingController contPrivateCarName;
  late final TextEditingController contPrivateCarSeat;
  late final TextEditingController contPrivateCarGasCharge;
  late final TextEditingController contMode;
  late final TextEditingController contBudgetMinimum;
  late final TextEditingController contBudgetMaximum;
  /*late final TextEditingController contStayAirbnb;
  late final TextEditingController contStayHostel;
  late final TextEditingController contStayDormitory;
  late final TextEditingController contStayOther;*/
  //
  /*static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();*/
  var arrAllOfStays = [];
  @override
  void initState() {
    contPrivateCarName = TextEditingController();
    contPrivateCarSeat = TextEditingController();
    contPrivateCarGasCharge = TextEditingController();
    contMode = TextEditingController();
    contBudgetMinimum = TextEditingController();
    contBudgetMaximum = TextEditingController();
    //
    // only check first page data
    checkValueFromFirstDetailsPage();
    super.initState();
  }

  @override
  void dispose() {
    contPrivateCarName.dispose();
    contPrivateCarSeat.dispose();
    contPrivateCarGasCharge.dispose();
    contMode.dispose();
    contBudgetMinimum.dispose();
    contBudgetMaximum.dispose();

    super.dispose();
  }

  create() {}
  checkValueFromFirstDetailsPage() {
    if (kDebugMode) {
      print('=============================');
      print(widget.strTravelTitle);
      print(widget.strTravelYouFrom);
      print(widget.strTravelGoingTo);
      print(widget.strTravelStartDate);
      print(widget.strTravelEndDate);
      print('=============================');
    }
    DateTime date1 = DateTime.parse(widget.strTravelStartDate);
    DateTime date2 = DateTime.parse(widget.strTravelEndDate);
    if (kDebugMode) {
      print('======= TOTAL DAYS ==========');
      print(daysBetween(date1, date2));
      print('=============================');
    }
    strTotalNumbersOfDays = daysBetween(date1, date2).toString();
    //
    // call set type od stays
    allTypeOfStays();
  }

  allTypeOfStays() {
    //
    arrAllOfStays = [
      {
        'name': 'Airbnb',
        'status': '0',
      },
      {
        'name': 'Hostel',
        'status': '0',
      },
      {
        'name': 'Hotel',
        'status': '0',
      },
      {
        'name': 'Apartment',
        'status': '0',
      },
      {
        'name': 'Botique',
        'status': '0',
      },
      {
        'name': 'Guest House',
        'status': '0',
      },
      {
        'name': 'Campsite',
        'status': '0',
      },
      {
        'name': 'Villa',
        'status': '0',
      },
      {
        'name': 'Cottage',
        'status': '0',
      },
      {
        'name': 'Resort',
        'status': '0',
      },
      {
        'name': 'Homestays',
        'status': '0',
      },
      {
        'name': 'Suits',
        'status': '0',
      },
      {
        'name': 'Bunglow',
        'status': '0',
      }
    ];

    if (kDebugMode) {
      print(arrAllOfStays);
    }
    setState(() {
      strScreenLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: strScreenLoader == true
            ? const CircularProgressIndicator()
            : Form(
                key: formKey,
                child: Column(
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
                                padding: const EdgeInsets.only(
                                    right: 24.0, left: 24.0),
                                child: TextFormField(
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                  controller: contPrivateCarName,
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
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                  controller: contPrivateCarSeat,
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
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                  controller: contPrivateCarGasCharge,
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
                            padding:
                                const EdgeInsets.only(right: 24.0, left: 24.0),
                            child: TextFormField(
                              // keyboardType: TextInputType.number,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              controller: contMode,
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: text_bold_open(
                            'Budget',
                            const Color.fromARGB(200, 0, 0, 0),
                            26.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 24.0, right: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: text_regular_mons(
                          'You can tell us about your budget. ( min and max ). So we will filter your buddies accordingly.',
                          Colors.black,
                          10.0,
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
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              controller: contBudgetMinimum,
                              obscureText: false,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Minimum',
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
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 24.0, left: 24.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              controller: contBudgetMaximum,
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
                                hintText: 'maximum',
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
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
                      padding: const EdgeInsets.only(
                          top: 10, left: 24.0, right: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: text_regular_mons(
                          'where you going to stay. \nIf you have any particular place in mind so please let us know.',
                          Colors.black,
                          10.0,
                        ),
                      ),
                    ),
                    /*Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            //fillColor: Colors.blue,
                            value: isCheckedAirbnb,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedAirbnb = value!;
                                //
                                isCheckedOther = false;
                              });
                            },
                          ),
                          isCheckedAirbnb == true
                              ? text_bold_mons(
                                  'Airbnb',
                                  Colors.black,
                                  14.0,
                                )
                              : text_regular_mons(
                                  'Airbnb',
                                  Colors.black,
                                  14.0,
                                )
                        ],
                      ),
                    ),*/
                    //hotel
                    Column(
                      children: [
                        for (int i = 0; i < arrAllOfStays.length; i++) ...[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 18.0),
                            child: Row(
                              children: [
                                /*Checkbox(
                                  checkColor: Colors.white,
                                  //fillColor: Colors.blue,
                                  value: isCheckedHotel,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedHotel = value!; //
                                      isCheckedOther = false;
                                    });
                                  },
                                ),*/
                                GestureDetector(
                                  onTap: () {
                                    //
                                    if (kDebugMode) {
                                      print(i);
                                    }
                                    //
                                    var strName =
                                        arrAllOfStays[i]['name'].toString();
                                    var strTick =
                                        arrAllOfStays[i]['status'].toString();
                                    // print(strName);
                                    // print(strTick);
                                    //
                                    // remove from array
                                    arrAllOfStays.removeAt(i);
                                    //
                                    // insert
                                    if (strTick == '0') {
                                      var newData = {
                                        'name': strName.toString(),
                                        'status': '1'.toString(),
                                      };
                                      arrAllOfStays.insert(i, newData);
                                      // print(arrAllOfStays);
                                    } else {
                                      var newData = {
                                        'name': strName.toString(),
                                        'status': '0'.toString(),
                                      };
                                      arrAllOfStays.insert(i, newData);
                                      // print(arrAllOfStays);
                                    }
                                    setState(() {});
                                  },
                                  child: (arrAllOfStays[i]['status']
                                              .toString() ==
                                          '0'.toString())
                                      ? text_regular_mons(
                                          //
                                          arrAllOfStays[i]['name'].toString(),
                                          Colors.black,
                                          16.0,
                                        )
                                      : Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            text_bold_mons(
                                              //
                                              arrAllOfStays[i]['name']
                                                  .toString(),
                                              Colors.black,
                                              16.0,
                                            ),
                                            const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ]
                      ],
                    ),
                    /*MultiSelectDialogField(
                      items: _items,
                      title: Text("Animals"),
                      selectedColor: Colors.blue,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      buttonIcon: Icon(
                        Icons.pets,
                        color: Colors.blue,
                      ),
                      buttonText: Text(
                        "Favorite Animals",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        // _selectedAnimals = results;
                      },
                    ),
                    SizedBox(height: 50),
                    /*MultiSelectChipField(
                      items: _items,
                      initialValue: [_animals[4], _animals[7], _animals[9]],
                      title: Text("Animals"),
                      headerColor: Colors.blue.withOpacity(0.5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 64, 73, 81),
                            width: 1.8),
                      ),
                      selectedChipColor: Colors.blue.withOpacity(0.5),
                      selectedTextStyle: TextStyle(color: Colors.blue[800]),
                      onTap: (values) {
                        //_selectedAnimals4 = values;
                      },
                    ),
                    SizedBox(height: 40),*/
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 20,
                          color: Colors.amber,
                          child: text_bold_mons(
                            'Dishant Rajput',
                            Colors.black,
                            14.0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.4),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          MultiSelectBottomSheetField(
                            initialChildSize: 0.4,
                            listType: MultiSelectListType.CHIP,
                            searchable: true,
                            buttonText: Text("Favorite Animals"),
                            title: Text("Animals"),
                            items: _items,
                            onConfirm: (values) {
                              // _selectedAnimals2 = values;
                              print(values);
                            },
                            chipDisplay: MultiSelectChipDisplay(
                              onTap: (value) {
                                setState(() {
                                  _selectedAnimals2.remove(value);
                                });
                              },
                            ),
                          ),
                          /*_selectedAnimals2.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "None selected",
                                    style: TextStyle(color: Colors.black54),
                                  ))
                              : Container(),*/
                        ],
                      ),
                    ),
                    SizedBox(height: 40),*/
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // builder: (context) => const HomeFeedScreen(),
                              builder: (context) => TravelBuddyPrefrencesScreen(
                                getInBuddyTripTitle:
                                    widget.strTravelTitle.toString(),
                                getInBuddyYouFrom:
                                    widget.strTravelYouFrom.toString(),
                                getInBuddyGoingTo:
                                    widget.strTravelGoingTo.toString(),
                                getInBuddyStartDate:
                                    widget.strTravelStartDate.toString(),
                                getInBuddyEndDate:
                                    widget.strTravelEndDate.toString(),
                                getModeVehicle: contMode.text.toString(),
                                getModeVehicleName:
                                    contPrivateCarName.text.toString(),
                                getModeVehicleSeatCapacity:
                                    contPrivateCarSeat.text.toString(),
                                getModeVehicleGas:
                                    contPrivateCarGasCharge.text.toString(),
                                getTotalNumberOfDays:
                                    strTotalNumbersOfDays.toString(),
                                arrGetStayData: arrAllOfStays,
                              ),
                            ),
                          );
                        }
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
              ),
      ),
    );
  }
}
