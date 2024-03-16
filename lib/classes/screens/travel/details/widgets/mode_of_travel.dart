import 'package:flutter/foundation.dart';
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
          ? Row(
              children: [
                text_regular_open(
                  'str',
                  Colors.black,
                  12.0,
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
