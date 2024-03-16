// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../headers/utils/utils.dart';

class WidgetModeOfTravelUIKit extends StatelessWidget {
  const WidgetModeOfTravelUIKit(
      {super.key,
      required this.strMode,
      required this.strVehicleName,
      required this.strVehicleGas,
      required this.strVehicleSeat});

  final String strMode;
  final String strVehicleName;
  final String strVehicleGas;
  final String strVehicleSeat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: strVehicleName != ''
          ? Column(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                text_regular_poppins(
                  "Dishant Rajput's private vehicle",
                  Colors.black,
                  10.0,
                ),
                Image.asset(
                  "assets/images/gif_car.gif",
                  height: 30.0,
                  width: 30.0,
                ),
                text_bold_poppins(
                  //
                  ' $strVehicleName',
                  Colors.black,
                  14.0,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                text_regular_poppins(
                  'Dishant Rajput wants to travel in',
                  Colors.black,
                  10.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if (strMode == 'Flight') ...[
                  Image.asset(
                    "assets/images/plane.gif",
                    height: 30.0,
                    width: 30.0,
                  ),
                ] else if (strMode == 'Bus') ...[
                  Image.asset(
                    "assets/images/gif_bus.gif",
                    height: 30.0,
                    width: 30.0,
                  ),
                ] else if (strMode == 'Car') ...[
                  Image.asset(
                    "assets/images/gif_car.gif",
                    height: 30.0,
                    width: 30.0,
                  ),
                ] else if (strMode == 'Caravan') ...[
                  Image.asset(
                    "assets/images/gif_caravan.gif",
                    height: 30.0,
                    width: 30.0,
                  ),
                ] else if (strMode == 'Train') ...[
                  Image.asset(
                    "assets/images/gif_train.gif",
                    height: 30.0,
                    width: 30.0,
                  ),
                ] else if (strMode == 'Cab') ...[
                  Image.asset(
                    "assets/images/gif_cab.gif",
                    height: 30.0,
                    width: 30.0,
                  ),
                ],
                text_bold_poppins(
                  //
                  ' $strMode',
                  Colors.black,
                  14.0,
                ),
              ],
            ),
    );
  }
}

// 50200010427584
// car choice