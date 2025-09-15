import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kingdom_care_services_app/constants/api_endpoints.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/models/generic_api_response.dart';

class ApiService {
  // Singleton pattern
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        headers: {"Content-Type": "application/json"},
        // Accept all status codes and handle manually
        validateStatus: (status) => true,
      ),
    );

    // Logging
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        // logPrint: (obj) => log(obj.toString()),
      ),
    );

    // ✅ Add interceptor to log all requests
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       // log("➡️ ${options.method} ${options.baseUrl}${options.path}");
    //       return handler.next(options);
    //     },
    //     onResponse: (response, handler) {
    //       // log(
    //       // "✅ Response ${response.statusCode}: ${response.requestOptions.path}",
    //       // );
    //       return handler.next(response);
    //     },
    //     onError: (DioException e, handler) {
    //       // log(
    //       //   "❌ Error ${e.response?.statusCode ?? 'No status'}: ${e.requestOptions.path}",
    //       // );
    //       return handler.next(e);
    //     },
    //   ),
    // );
  }

  late Dio _dio;
  final String _baseUrl = ApiEndpoints.BASE_URL;

  void setAuthToken(String token) {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  void removeAuthToken() {
    _dio.options.headers.remove("Authorization");
  }

  // ------------------ GENERIC REQUEST METHODS ------------------

  Future<GenericApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return _handleResponse(response);
    } catch (e) {
      return GenericApiResponse(
        isSuccess: false,
        statusCode: 500,
        error: e.toString(),
      );
    }
  }

  Future<GenericApiResponse> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );
      return _handleResponse(response);
    } catch (e) {
      return GenericApiResponse(
        isSuccess: false,
        statusCode: 500,
        error: e.toString(),
      );
    }
  }

  Future<GenericApiResponse> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );
      return _handleResponse(response);
    } catch (e) {
      return GenericApiResponse(
        isSuccess: false,
        statusCode: 500,
        error: e.toString(),
      );
    }
  }

  Future<GenericApiResponse> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );
      return _handleResponse(response);
    } catch (e) {
      return GenericApiResponse(
        isSuccess: false,
        statusCode: 500,
        error: e.toString(),
      );
    }
  }

  // ------------------ FILE UPLOAD ------------------
  Future<GenericApiResponse> uploadFile(
    String endpoint, {
    required File file,
    String fileKey = "file",
    Map<String, dynamic>? fields,
  }) async {
    try {
      final formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
        ...?fields,
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(contentType: "multipart/form-data"),
      );

      return _handleResponse(response);
    } catch (e) {
      return GenericApiResponse(
        isSuccess: false,
        statusCode: 500,
        error: e.toString(),
      );
    }
  }

  // ------------------ PRIVATE ERROR HANDLER ------------------
  String _handleDioError(DioException e) {
    String errorMessage = ApiResponseMessages.somethingWentWrong;

    // Server returned a response
    if (e.response != null && e.response?.data != null) {
      final data = e.response!.data;
      // Try to get 'error' first, then 'message', fallback to generic
      errorMessage = data['error'] ?? data['message'] ?? errorMessage;
    }
    // Connection or timeout issues
    else {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = "Connection timed out";
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = "Request timed out";
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = "Receive timeout occurred";
          break;
        case DioExceptionType.cancel:
          errorMessage = "Request was cancelled";
          break;
        case DioExceptionType.badCertificate:
          errorMessage = "Bad certificate";
          break;
        case DioExceptionType.unknown:
          errorMessage = "Network error: ${e.message}";
          break;
        case DioExceptionType.badResponse:
          errorMessage =
              "Received invalid status code: ${e.response?.statusCode}";
          break;
        default:
          errorMessage = "Network error: ${e.message}";
          break;
      }
    }

    return errorMessage;
  }

  // ------------------ PRIVATE ------------------
  GenericApiResponse _handleResponse(Response response) {
    // 2xx is success
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return GenericApiResponse.fromJson(response.data, response.statusCode);
    }

    // 4xx or 5xx errors
    final errorMessage =
        response.data?['error'] ??
        response.data?['message'] ??
        ApiResponseMessages.somethingWentWrong;

    return GenericApiResponse(
      isSuccess: false,
      statusCode: response.statusCode ?? 500,
      error: errorMessage,
    );
  }
}
