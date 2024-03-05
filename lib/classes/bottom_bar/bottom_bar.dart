// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// lazy load index
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:trust_travel/classes/screens/home/home.dart';
import 'package:trust_travel/classes/screens/travel/add_travel/add_travel.dart';
import 'package:trust_travel/classes/screens/travel/travel_list/travel_list.dart';

import '../headers/utils/utils.dart';
import '../screens/add_dashboard/add_dashboard.dart';

//
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({
    super.key,
    required this.specificBarIndex,
  });

  final int specificBarIndex;

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  //
  final PageStorageBucket bucket = PageStorageBucket();
  int selectedIndex = 2;

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  int maxCount = 5;

// lazy index stack
  // int lazyIndex = widget.specificBarIndex;
//
  @override
  void initState() {
    selectedIndex = widget.specificBarIndex;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: LazyLoadIndexedStack(
          index: selectedIndex,
          children: const [
            //
            // home
            HomeScreen(),
            //
            AddDashboardScreen(),
            //
            // travell : list
            TravelListScreen(),
            //
          ],
        ),
        bottomNavigationBar: SizedBox(
          // height: 92,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 14.0,
            ),
            selectedFontSize: 14.0,
            // backgroundColor: home_page_bottom_tab_color(),
            onTap: (index) {
              setState(() => selectedIndex = index);
            },
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                // backgroundColor: home_page_bottom_tab_color(),
                // backgroundColor: Colors.white,
                icon: Icon(
                  Icons.celebration,
                  color: Colors.black,
                ),
                label: 'Party',
              ),
              BottomNavigationBarItem(
                // backgroundColor: community_page_navigation_color(),
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                label: 'Create',
                activeIcon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 26,
                ),
              ),
              BottomNavigationBarItem(
                // backgroundColor: community_page_navigation_color(),
                icon: Icon(
                  Icons.travel_explore,
                  color: Colors.black,
                ),
                label: 'Travel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
