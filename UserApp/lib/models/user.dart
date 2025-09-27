class Certification {
  String name;
  String? issuedBy;
  DateTime? issueDate;
  DateTime? expiryDate;

  Certification({
    required this.name,
    this.issuedBy,
    this.issueDate,
    this.expiryDate,
  });

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: json['name'],
      issuedBy: json['issuedBy'],
      issueDate: json['issueDate'] != null
          ? DateTime.parse(json['issueDate'])
          : null,
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'issuedBy': issuedBy,
      'issueDate': issueDate?.toIso8601String(),
      'expiryDate': expiryDate?.toIso8601String(),
    };
  }
}

class Review {
  String reviewerId;
  String revieweeId;
  String? shiftId;
  int rating;
  String? comment;
  DateTime createdAt;

  Review({
    required this.reviewerId,
    required this.revieweeId,
    this.shiftId,
    required this.rating,
    this.comment,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewerId: json['reviewer'],
      revieweeId: json['reviewee'],
      shiftId: json['shift'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviewer': reviewerId,
      'reviewee': revieweeId,
      'shift': shiftId,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  DateTime dateOfBirth;
  String passwordHash;
  String? phone;
  String? address;
  String? profilePicture;

  String? jobTitle;
  List<String>? skills;
  int? yearsOfExperience;

  bool dbsCheck;
  List<Certification>? certifications;
  bool rightToWorkStatus;
  bool idVerification;

  List<String>? preferredShiftTypes;
  int? maxWeeklyHours;

  String role;
  String status;
  DateTime dateJoined;
  DateTime? lastLogin;

  int numberOfAssignments;
  double averageRating;
  List<Review>? reviews;
  int numberOfComplaints;
  int numberOfCompletedAssignments;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.passwordHash,
    this.phone,
    this.address,
    this.profilePicture,
    this.jobTitle,
    this.skills,
    this.yearsOfExperience,
    this.dbsCheck = false,
    this.certifications,
    this.rightToWorkStatus = false,
    this.idVerification = false,
    this.preferredShiftTypes,
    this.maxWeeklyHours,
    this.role = "care_worker",
    this.status = "active",
    DateTime? dateJoined,
    this.lastLogin,
    this.numberOfAssignments = 0,
    this.averageRating = 0,
    this.reviews,
    this.numberOfComplaints = 0,
    this.numberOfCompletedAssignments = 0,
  }) : dateJoined = dateJoined ?? DateTime.now();

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      passwordHash: json['passwordHash'],
      phone: json['phone'],
      address: json['address'],
      profilePicture: json['profilePicture'],
      jobTitle: json['jobTitle'],
      skills: json['skills'] != null ? List<String>.from(json['skills']) : null,
      yearsOfExperience: json['yearsOfExperience'],
      dbsCheck: json['dbsCheck'] ?? false,
      certifications: json['certifications'] != null
          ? (json['certifications'] as List)
                .map((e) => Certification.fromJson(e))
                .toList()
          : null,
      rightToWorkStatus: json['rightToWorkStatus'] ?? false,
      idVerification: json['idVerification'] ?? false,
      preferredShiftTypes: json['preferredShiftTypes'] != null
          ? List<String>.from(json['preferredShiftTypes'])
          : null,
      maxWeeklyHours: json['maxWeeklyHours'],
      role: json['role'] ?? "care_worker",
      status: json['status'] ?? "active",
      dateJoined: json['dateJoined'] != null
          ? DateTime.parse(json['dateJoined'])
          : DateTime.now(),
      lastLogin: json['lastLogin'] != null
          ? DateTime.parse(json['lastLogin'])
          : null,
      numberOfAssignments: json['numberOfAssignments'] ?? 0,
      averageRating: json['averageRating'] != null
          ? json['averageRating'] + 0.0
          : 0.0,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List).map((e) => Review.fromJson(e)).toList()
          : null,
      numberOfComplaints: json['numberOfComplaints'] ?? 0,
      numberOfCompletedAssignments: json['numberOfCompletedAssignments'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'passwordHash': passwordHash,
      'phone': phone,
      'address': address,
      'profilePicture': profilePicture,
      'jobTitle': jobTitle,
      'skills': skills,
      'yearsOfExperience': yearsOfExperience,
      'dbsCheck': dbsCheck,
      'certifications': certifications?.map((e) => e.toJson()).toList(),
      'rightToWorkStatus': rightToWorkStatus,
      'idVerification': idVerification,
      'preferredShiftTypes': preferredShiftTypes,
      'maxWeeklyHours': maxWeeklyHours,
      'role': role,
      'status': status,
      'dateJoined': dateJoined.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'numberOfAssignments': numberOfAssignments,
      'averageRating': averageRating,
      'reviews': reviews?.map((e) => e.toJson()).toList(),
      'numberOfComplaints': numberOfComplaints,
      'numberOfCompletedAssignments': numberOfCompletedAssignments,
    };
  }

  void updateAverageRating() {
    if (reviews == null || reviews!.isEmpty) {
      averageRating = 0.0;
    } else {
      double total = reviews!.fold(0.0, (sum, r) => sum + r.rating);
      averageRating = total / reviews!.length;
    }
  }
}
