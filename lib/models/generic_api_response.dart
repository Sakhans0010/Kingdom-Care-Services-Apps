import 'package:kingdom_care_services_app/constants/api_response_messages.dart';

class GenericApiResponse {
  final int statusCode;
  final bool isSuccess;
  final String? message;
  final dynamic data;
  final String? error;

  GenericApiResponse({
    required this.statusCode,
    required this.isSuccess,
    this.message,
    this.data,
    this.error,
  });

  // Factory constructor for JSON parsing
  factory GenericApiResponse.fromJson(
    Map<String, dynamic> json,

    int? statusCode,
  ) {
    // log("GenericApiResponse JSON: $json");

    if (json['success'] == true) {
      return GenericApiResponse(
        isSuccess: true,
        statusCode: statusCode ?? 200,
        data: json['data'],
        message: json['message'],
      );
    } else {
      return GenericApiResponse(
        isSuccess: false,
        statusCode: statusCode ?? 400,
        error: json['error'] ?? ApiResponseMessages.somethingWentWrong,
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'success': isSuccess,
      'statusCode': statusCode,
      'data': data,
      'message': message,
      'error': error,
    };
  }
}
