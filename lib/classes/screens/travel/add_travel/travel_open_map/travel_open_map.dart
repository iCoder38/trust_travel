import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelOpenMapScreen extends StatefulWidget {
  const TravelOpenMapScreen({super.key});

  @override
  State<TravelOpenMapScreen> createState() => _TravelOpenMapScreenState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class _TravelOpenMapScreenState extends State<TravelOpenMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
