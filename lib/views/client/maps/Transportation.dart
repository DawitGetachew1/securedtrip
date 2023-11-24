import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class TransportationMap extends StatefulWidget {
  const TransportationMap({super.key});

  @override
  _TransportationMapState createState() => _TransportationMapState();
}

class _TransportationMapState extends State<TransportationMap> {
  String? _startAddress;
  String? _destinationAddress;
  GoogleMapController? _controller;
  final Completer<GoogleMapController> controller=
  Completer<GoogleMapController>();
  Marker? _startMarker;
  Marker? _destinationMarker;
  LatLng? _initialCameraPosition;
  loc.Location location = loc.Location();
  loc.LocationData? _currentPosition;
  @override
  void initState() {
    super.initState();
    getCurrentLoction();
  }
  Future<void> updateAddresses() async {
    if (_startMarker != null) {
      List<Placemark> startPlacemarks =
      await placemarkFromCoordinates(_startMarker!.position.latitude, _startMarker!.position.longitude);
      if (startPlacemarks.isNotEmpty) {
        Placemark placemark = startPlacemarks[0];
        String formattedAddress =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
        setState(() {
          _startAddress = formattedAddress;
        });
      }
    }

    if (_destinationMarker != null) {
      List<Placemark> destinationPlacemarks =
      await placemarkFromCoordinates(_destinationMarker!.position.latitude, _destinationMarker!.position.longitude);
      if (destinationPlacemarks.isNotEmpty) {
        Placemark placemark = destinationPlacemarks[0];
        String formattedAddress =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
        setState(() {
          _destinationAddress = formattedAddress;
        });
      }
    }
  }

  getCurrentLoction() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    if(permissionGranted == loc.PermissionStatus.granted){
      location.changeSettings(accuracy: loc.LocationAccuracy.high);
      _currentPosition = await location.getLocation();
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
        LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
        zoom: 16,
      )));
      setState(() {
        _initialCameraPosition =
            LatLng(_currentPosition!.latitude!,_currentPosition!.longitude!);

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Perform any action with the selected markers (start and destination)
            if (_startMarker != null && _destinationMarker != null) {
              // Do something with the selected markers
              print('Start Marker: ${_startMarker!.position}');
              print('Destination Marker: ${_destinationMarker!.position}');
            } else {
              print('Please select both a start and a destination marker.');
            }
          },
          child: const Icon(Icons.directions),
        ),
      body: _initialCameraPosition != null
      ? Stack(
        children:[ GoogleMap(
        initialCameraPosition: CameraPosition(
        target: _initialCameraPosition!,
        zoom: 12,
        ),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller){
        _controller = controller;
        },
        markers: {
        if (_startMarker != null) _startMarker!,
        if (_destinationMarker != null) _destinationMarker!,
        },
        onTap: (LatLng latLng) {
        setState(() {
        if (_startMarker == null) {
        _startMarker = Marker(
        markerId: const MarkerId('start'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        );
        } else if (_destinationMarker == null) {
        _destinationMarker = Marker(
        markerId: const MarkerId('destination'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        );
        } else {
        _startMarker = Marker(
        markerId: const MarkerId('start'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        );
        _destinationMarker = null;
        }
        updateAddresses();
        });
        },
        ),
          Positioned(
              top: 43*fem,
              left: 16*fem,
              right: 16*fem,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: Text(_startAddress != null && _startAddress!.isNotEmpty
                    ? _startAddress!
                    : 'Pick your starting address',
                  overflow: TextOverflow.visible, softWrap: true,
                ),
              )),
          Positioned(
              top: 93*fem,
              left: 16*fem,
              right: 16*fem,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: Text(_destinationAddress != null && _destinationAddress!.isNotEmpty
                    ? _destinationAddress!
                    : 'Pick your destination address',
                  overflow: TextOverflow.visible, softWrap: true,
                ),
              ))
      ]
      )
          : const Center(
      child: CircularProgressIndicator(),
      ),


      ),
    );
  }
}
