import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';
import 'package:kingdom_care_services_app/constants/api_endpoints.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/constants/schemas.dart';
import 'package:kingdom_care_services_app/constants/storage_keys.dart';
import 'package:kingdom_care_services_app/models/generic_api_response.dart';
import 'package:kingdom_care_services_app/services/api_services.dart';
import 'package:kingdom_care_services_app/services/storage_services.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  final _api = ApiService();
  final _storage = SecureStorageService();

  /// -------------------- TOKEN --------------------
  Future<String?> loadToken() async {
    final token = await _storage.read(key: StorageKeys.authToken);
    if (token != null) {
      _api.setAuthToken(token);
      state = true;
    }
    return token;
  }

  Future<void> clearToken() async {
    await _storage.delete(key: StorageKeys.authToken);
    _api.removeAuthToken();
    state = false;
  }

  /// -------------------- SIGNUP --------------------
  Future<GenericApiResponse> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dateOfBirth, // dd-MM-yyyy
    required String phone,
    required String countryCode,
  }) async {
    final body = {
      UserSchema.FIRST_NAME: firstName,
      UserSchema.LAST_NAME: lastName,
      UserSchema.EMAIL: email,
      UserSchema.PASSWORD: password,
      UserSchema.DATE_OF_BIRTH: dateOfBirth,
      UserSchema.PHONE: "$countryCode$phone",
    };

    return _callApi(() => _api.post(ApiEndpoints.SIGNUP, data: body));
  }

  /// -------------------- SIGNIN --------------------
  Future<GenericApiResponse> signin({
    required String email,
    required String password,
  }) async {
    final body = {AuthSchema.EMAIL: email, AuthSchema.PASSWORD: password};
    return _callApi(() => _api.post(ApiEndpoints.SIGNIN, data: body));
  }

  /// -------------------- PRIVATE API CALL HANDLER --------------------
  Future<GenericApiResponse> _callApi(
    Future<GenericApiResponse> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();

      if (response.isSuccess) {
        // Save token if present
        if (response.data['token'] != null) {
          final token = response.data['token'];
          await _storage.write(key: StorageKeys.authToken, value: token);
          _api.setAuthToken(token);
          state = true;
        }

        return response;
      } else {
        final errorMsg =
            response.error ?? ApiResponseMessages.somethingWentWrong;

        return GenericApiResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          error: errorMsg,
        );
      }
    } catch (e) {
      log("Error while _callApi: $e");
      return GenericApiResponse(
        statusCode: 500,
        isSuccess: false,
        error: ApiResponseMessages.somethingWentWrong,
      );
    }
  }

  Future<GenericApiResponse> logout() async {
    await clearToken();
    state = false;
    return GenericApiResponse(
      statusCode: 200,
      isSuccess: true,
      message: ApiResponseMessages.loggedOutSuccessfully,
    );
  }
}
