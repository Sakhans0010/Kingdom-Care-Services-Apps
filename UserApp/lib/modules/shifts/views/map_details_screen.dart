import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kingdom_care_services_app/models/shift.dart';

class MapDetailsScreen extends StatefulWidget {
  final ShiftItem shift;
  const MapDetailsScreen({super.key, required this.shift});

  @override
  State<MapDetailsScreen> createState() => _MapDetailsScreenState();
}

class _MapDetailsScreenState extends State<MapDetailsScreen> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.shift.location.latitude,
                widget.shift.location.longitude,
              ),
              zoom: 16,
            ),
            mapType: MapType.normal,

            // zoomGesturesEnabled: true,
            // scrollGesturesEnabled: true,
            // rotateGesturesEnabled: true,
            // tiltGesturesEnabled: true,
            // myLocationButtonEnabled: true, // hide default
            // myLocationEnabled: true,
            // zoomControlsEnabled: true,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            markers: {
              Marker(
                markerId: const MarkerId('shiftLocation'),
                position: LatLng(
                  widget.shift.location.latitude,
                  widget.shift.location.longitude,
                ),
              ),
            },
            onMapCreated: (controller) {
              _mapController = controller;
            },
          ),

          // Back button
          Positioned(top: 0, left: 20, child: _buildBackButton()),

          // Custom zoom buttons
          // Positioned(
          //   bottom: 40,

          //   right: 20,
          //   child: Column(
          //     children: [
          //       FloatingActionButton(
          //         mini: true,
          //         heroTag: "zoomIn",
          //         onPressed: () async {
          //           final zoom = await _mapController.getZoomLevel();
          //           _mapController.animateCamera(CameraUpdate.zoomTo(zoom + 1));
          //         },
          //         child: Icon(Icons.add),
          //       ),
          //       SizedBox(height: 10),
          //       FloatingActionButton(
          //         mini: true,
          //         heroTag: "zoomOut",
          //         onPressed: () async {
          //           final zoom = await _mapController.getZoomLevel();
          //           _mapController.animateCamera(CameraUpdate.zoomTo(zoom - 1));
          //         },
          //         child: Icon(Icons.remove),
          //       ),
          //       SizedBox(height: 10),
          //       FloatingActionButton(
          //         mini: true,
          //         heroTag: "myLocation",
          //         onPressed: () {
          //           _mapController.animateCamera(
          //             CameraUpdate.newCameraPosition(
          //               CameraPosition(
          //                 target: LatLng(
          //                   widget.shift.location.latitude,
          //                   widget.shift.location.longitude,
          //                 ),
          //                 zoom: 16,
          //               ),
          //             ),
          //           );
          //         },
          //         child: Icon(Icons.my_location),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
