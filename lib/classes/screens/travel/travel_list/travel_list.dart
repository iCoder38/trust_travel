import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trust_travel/classes/headers/utils/utils.dart';

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWithRegularStyle(
          'Travell',
          16.0,
          Colors.black,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    14.0,
                  ),
                  border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      //width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: Center(
                        child: textWithRegularStyle(
                          'Domestic',
                          14.0,
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      //width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          14.0,
                        ),
                      ),
                      child: Center(
                        child: textWithRegularStyle(
                          'International',
                          14.0,
                          Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++) ...[
                      Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(
                            14.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            14.0,
                          ),
                          child: Image.asset(
                            'assets/images/dummy_party2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ), //
                      ListTile(
                        title: textWithSemiBoldStyle(
                          'Yeaaaaa!!!! to Goa',
                          18.0,
                          Colors.black,
                        ),
                        subtitle: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 4.0,
                                top: 4.0,
                              ),
                              child: Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.thumb_up,
                                      size: 16.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: textWithRegularStyle(
                                      'Open for all',
                                      14.0,
                                      Colors.pinkAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
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
                                    child: textWithRegularStyle(
                                      //
                                      '25/Feb/2024 - 3/Mar/2024',
                                      12.0,
                                      Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textWithRegularStyle(
                              'Dishant Rajput',
                              12.0,
                              Colors.black,
                            ),
                            textWithRegularStyle(
                              'Host from Delhi',
                              8.0,
                              Colors.black38,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),

        /*Column(
          children: [
            
            
            
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  14.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  14.0,
                ),
                child: Image.asset(
                  'assets/images/dummy_party2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //
            ListTile(
              title: textWithSemiBoldStyle(
                'To Thailand',
                18.0,
                Colors.black,
              ),
              subtitle: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 4.0,
                      top: 4.0,
                    ),
                    child: Row(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.thumb_up,
                            size: 16.0,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textWithRegularStyle(
                            'Only for Boys',
                            14.0,
                            Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
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
                          child: textWithRegularStyle(
                            //
                            '25/Feb/2024 - 3/Mar/2024',
                            12.0,
                            Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWithRegularStyle(
                    'Dishant Rajput',
                    12.0,
                    Colors.black,
                  ),
                  textWithRegularStyle(
                    'Host from Delhi',
                    8.0,
                    Colors.black38,
                  ),
                ],
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}
