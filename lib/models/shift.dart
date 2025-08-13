class ShiftItem {
  final String role;
  final String title;
  final String notes;
  final DateTime startDateAndTime;
  final DateTime endDateAndTime;
  final Location location;
  final String ratePerHour;

  ShiftItem({
    required this.role,
    required this.title,
    required this.notes,
    required this.startDateAndTime,
    required this.endDateAndTime,
    required this.location,
    required this.ratePerHour,
  });
}

class Location {
  final double latitude;
  final double longitude;
  final String address;

  Location({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude, 'address': address};
  }
}
