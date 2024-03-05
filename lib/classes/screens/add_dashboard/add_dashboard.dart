import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trust_travel/classes/headers/utils/utils.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/add_travel.dart';

class AddDashboardScreen extends StatelessWidget {
  const AddDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              //
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => const HomeFeedScreen(),
                  builder: (context) => const AddTravelScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    14.0,
                  ),
                  child: Image.asset(
                    'assets/images/travel_front.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          text_regular_mons(
            '[ custom message ]',
            Colors.black,
            14.0,
          ),
        ],
      ),
    );
  }
}
