import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/app_utils/app_images.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';
import 'package:kingdom_care_services_app/models/shift.dart';

class ShiftDetailsScreen extends StatefulWidget {
  final ShiftItem shift;
  const ShiftDetailsScreen({super.key, required this.shift});

  @override
  State<ShiftDetailsScreen> createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildMap(),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 8,
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.15,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.shift.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryContainerColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.shift.ratePerHour,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        _buildInfoSection(
                          title: "START DATE & TIME",
                          icon: AppImages.CALENDER,
                          info:
                              "${DateFormat('dd MMM yyyy').format(widget.shift.startDateAndTime)}, ${DateFormat.jm().format(widget.shift.startDateAndTime)}",
                        ),
                        SizedBox(height: 8),

                        _buildInfoSection(
                          title: "END DATE & TIME",
                          icon: AppImages.CALENDER,
                          info:
                              "${DateFormat('dd MMM yyyy').format(widget.shift.endDateAndTime)}, ${DateFormat.jm().format(widget.shift.endDateAndTime)}",
                        ),
                        SizedBox(height: 8),

                        _buildInfoSection(
                          title: "ROLE",
                          icon: AppImages.ROLE,
                          info: widget.shift.role,
                        ),
                        SizedBox(height: 8),

                        _buildInfoSection(
                          title: "ADDRESS",
                          icon: AppImages.LOCATION,
                          info: widget.shift.location.address,
                        ),
                        SizedBox(height: 8),

                        _buildInfoSection(
                          title: "NOTES",
                          icon: AppImages.NOTES,
                          info: widget.shift.notes,
                        ),

                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 20,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,

        child: FloatingActionButton(
          onPressed: () {
            // Handle action, e.g., confirm shift
          },
          backgroundColor: AppColors.primaryColor,
          child: Text(
            "Confirm Shift",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Column _buildInfoSection({
    required String title,
    required String icon,
    required String info,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 5),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryColor.withValues(alpha: 0.15),
                ),
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 6),
              Text(
                info,

                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _buildMap() {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.shift.location.latitude,
            widget.shift.location.longitude,
          ),
          zoom: 16,
        ),
        zoomGesturesEnabled: false, // Disable zoom
        scrollGesturesEnabled: false, // Disable scroll
        rotateGesturesEnabled: false, // Disable rotate
        tiltGesturesEnabled: false, // Disable tilt
        myLocationButtonEnabled: false,
        markers: {
          Marker(
            markerId: const MarkerId('shiftLocation'),
            position: LatLng(
              widget.shift.location.latitude,
              widget.shift.location.longitude,
            ),
          ),
        },
      ),
    );
  }
}
