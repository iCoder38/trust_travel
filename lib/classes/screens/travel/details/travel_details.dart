import 'package:flutter/material.dart';

import '../../../headers/utils/utils.dart';

class TravelDetailsScreen extends StatefulWidget {
  const TravelDetailsScreen({super.key});

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
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
    );
  }
}
