// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
import 'package:trust_travel/classes/headers/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  // var strParty
  //
  var selectedIndex = 0;
  var strCategorySelect = '0';
  var strCategoryName = 'Party 1';

  var arrHeaderCategory = [
    //
    {
      'name': 'Party',
      'type': '1',
      'image': 'category_party',
    },
    {
      'name': 'Travel',
      'type': '0',
      'image': 'category_travel',
    },
    {
      'name': 'Birthday',
      'type': '0',
      'image': 'category_birthday',
    },
    {
      'name': 'Reunioun',
      'type': '0',
      'image': 'category_reunion',
    },
    {
      'name': 'Temple',
      'type': '0',
      'image': 'category_temple',
    },
    {
      'name': 'Gym',
      'type': '0',
      'image': 'category_gym',
    },
  ];
  var arrDummyCategoryPartyImage = [
    //
    {
      'name': 'In House Party',
      'location': 'Delhi, Dwarka',
      'image': 'assets/images/dummy_party.jpg',
      'date': '6 - March - 2024',
      'price': 'INR : 1200/-',
    },
    {
      'name': 'Farm House Party',
      'location': 'Delhi, Saket',
      'image': 'assets/images/dummy_party2.jpg',
      'date': '14 - March - 2024',
      'price': 'INR : 1000/-',
    },
    {
      'name': 'Private Party',
      'location': 'Rajasthan, Jaipur',
      'image': 'assets/images/dummy_party3.jpg',
      'date': '29 - March - 2024',
      'price': 'INR : 2400/-',
    },
  ];
  @override
  void initState() {
    //

    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        // appBar: AppBar(
        //   title: textWithSemiBoldStyle(
        //     'Home',
        //     16.0,
        //     Colors.black,
        //   ),
        //   automaticallyImplyLeading: false,
        // ),
        body: Column(
          children: [
            //
            const SizedBox(
              height: 40,
            ),
            //
            homeSearchBarUIKIT(),
            //
            homeCategoryListUIKIT(),
            //

            //
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: arrDummyCategoryPartyImage.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 14.0,
                            left: 14.0,
                            right: 14.0,
                          ),
                          child: Container(
                            // margin: EdgeInsets.all(0),
                            height: 240,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                24.0,
                              ),
                              child: Image.asset(
                                //
                                arrDummyCategoryPartyImage[index]['image']
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: textWithSemiBoldStyle(
                            //
                            arrDummyCategoryPartyImage[index]['name']
                                .toString(),
                            18.0, Colors.black,
                          ),
                          subtitle: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: textWithRegularStyle(
                                  //
                                  arrDummyCategoryPartyImage[index]['location']
                                      .toString(),
                                  12.0, Colors.black,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: textWithRegularStyle(
                                  //
                                  'Price : ${arrDummyCategoryPartyImage[index]['price']}',
                                  14.0, Colors.black,
                                ),
                              ),
                            ],
                          ),
                          trailing: textWithRegularStyle(
                            //
                            '${arrDummyCategoryPartyImage[index]['date']}',
                            10.0, Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding homeCategoryListUIKIT() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            //
            for (int i = 0; i < arrHeaderCategory.length; i++) ...[
              GestureDetector(
                onTap: () {
                  //
                  setState(() {
                    selectedIndex = i;
                  });
                  // updateCategoryType(i);
                },
                child: Container(
                  // width: 60,
                  // height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: selectedIndex == i
                        ? const Border(
                            bottom: BorderSide(
                              //
                              color: Colors.black,
                              width: 1.0,
                            ),
                          )
                        : const Border(
                            bottom: BorderSide(
                              //
                              color: Colors.white,
                              // width: 0.0,
                            ),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 34,
                          width: 34,
                          child: selectedIndex == i
                              ? Image.asset(
                                  'assets/images/${arrHeaderCategory[i]['image'].toString()}_color.png'
                                      .toString(),
                                )
                              : Image.asset(
                                  'assets/images/${arrHeaderCategory[i]['image'].toString()}.png',
                                ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        selectedIndex == i
                            ? textWithRegularStyle(
                                //
                                arrHeaderCategory[i]['name'].toString(),
                                12.0,
                                Colors.black,
                              )
                            : textWithRegularStyle(
                                //
                                arrHeaderCategory[i]['name'].toString(),
                                12.0,
                                Colors.black54,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                width: 40.0,
              ),
            ]
          ],
        ),
      ),
    );
  }

  Container homeSearchBarUIKIT() {
    return Container(
      height: 60.0,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 10.0,
                ),
                height: 60.0,
                // width: 120,

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                // child: ,
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: IconButton(
                  // focusColor: Colors.blue,
                  onPressed: () {
                    //
                  },
                  icon: const Icon(
                    Icons.tune,
                  ),
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*updateCategoryType(int index) {
    //
    arrHeaderCategory = [
      //
      {
        'name': 'Party 1',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 2',
        'type': '0',
        'image': 'category_travel',
      },
      {
        'name': 'Party 3',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 4',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 5',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 6',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 7',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 8',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 9',
        'type': '0',
        'image': 'category_party',
      },
      {
        'name': 'Party 10',
        'type': '0',
        'image': 'category_party',
      },
    ];
    //
    /*if (kDebugMode) {
      print('========== YOU CLICKED ==========');
      print('===================================');
      print(arrHeaderCategory[index]);
    }*/
    //
    var strSetName = arrHeaderCategory[index]['name'].toString();
    var strSetImageColor = arrHeaderCategory[index]['image'].toString();
    //
    if (kDebugMode) {
      print('name ==> $strSetImageColor');
    }
    /*
    if (kDebugMode) {
      print('===================================');
      print('===================================');
    }*/

    //
    arrHeaderCategory.removeAt(index);
    /*if (kDebugMode) {
      print('=====================================================');
      print('==== FULL ARRAY AFTER REMOVE ONE ITEM FROM ARRAY ====');
      print('=====================================================');
      print(arrHeaderCategory);
    }
    if (kDebugMode) {
      print('===================================');
      print('===================================');
    }*/
    //

    //
    var insert;

    insert = {
      'name': strSetName.toString(),
      'type': '1',
      'image':
          'assets/images/${strSetImageColor}_color.png' // 'assets/images/$strSetImageColor',
    };
    /*if (kDebugMode) {
      print('========== INSERT VALUE ==========');
      print('===================================');
      print(insert);
    }*/
    arrHeaderCategory.insert(index, insert);

    setState(() {
      strCategoryName = strSetName.toString();
    });
  }*/
}
