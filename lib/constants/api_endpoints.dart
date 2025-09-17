class ApiEndpoints {
  static const String BASE_URL = "http://localhost:8000";

  // =====================
  // AUTH
  // =====================
  static const String AUTH = "$BASE_URL/api/auth";
  static const String SIGNUP = "$AUTH/signup";
  static const String SIGNIN = "$AUTH/signin";

  // =====================
  // USERS
  // =====================
  static const String USERS = "$BASE_URL/api/users";

  static const String GET_USERS = USERS; // GET all
  static const String CREATE_USER = USERS; // POST

  static String GET_USER_BY_ID(String id) => "$USERS/$id";
  static String UPDATE_USER_BY_ID(String id) => "$USERS/$id";
  static String DELETE_USER_BY_ID(String id) => "$USERS/$id";

  // =====================
  // SHIFTS
  // =====================
  static const String SHIFTS = "$BASE_URL/api/shifts";

  static const String GET_SHIFTS = SHIFTS; // GET all
  static const String CREATE_SHIFT = SHIFTS; // POST (admin/manager)

  static String GET_SHIFT_BY_ID(String id) => "$SHIFTS/$id";
  static String UPDATE_SHIFT(String id) => "$SHIFTS/$id";
  static String DELETE_SHIFT(String id) => "$SHIFTS/$id";

  static const String ASSIGN_SHIFT = "$SHIFTS/assign"; // PATCH

  static String CANCEL_SHIFT(String id) => "$SHIFTS/$id/cancel";
  static String COMPLETE_SHIFT(String id) => "$SHIFTS/$id/complete";
  static String ACCEPT_SHIFT(String id) => "$SHIFTS/$id/accept";

  static const String GET_AVAILABLE_SHIFTS = "$SHIFTS/available";
}
