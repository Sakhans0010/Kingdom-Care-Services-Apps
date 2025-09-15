class UserSchema {
  static const String ID = "id";
  static const String FIRST_NAME = "firstName";
  static const String LAST_NAME = "lastName";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String DATE_OF_BIRTH = "dateOfBirth";
  static const String PHONE = "phone";
}

class AuthSchema {
  static const String TOKEN = "token";
  static const String REFRESH_TOKEN = "refreshToken";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
}

class ShiftSchema {
  static const String ID = "id";
  static const String TITLE = "title";
  static const String DESCRIPTION = "description";
  static const String START_TIME = "startTime";
  static const String END_TIME = "endTime";
  static const String STATUS = "status";
  static const String ASSIGNED_TO = "assignedTo";

  // Shift status values
  static const String STATUS_PENDING = "pending";
  static const String STATUS_ASSIGNED = "assigned";
  static const String STATUS_COMPLETED = "completed";
  static const String STATUS_CANCELED = "canceled";
}
