import 'package:dio/dio.dart';

enum Status {
  cancelled,
  success,
  error,
}

class ApiResponse<T> {
  final Status status;
  final String? message;
  final int? code;
  final T? data;

  const ApiResponse._({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  const ApiResponse.error(this.message)
      : status = Status.error,
        code = null,
        data = null;

  factory ApiResponse.fromResponse(Response response) {
    switch (response.statusCode) {
      case 200: // Successful
      case 201: // Successfully created
      case 204: // Successful with no response
        return ApiResponse._(status: Status.success, code: response.statusCode, message: null, data: response.data);
      case 400: // Request incorrect
      case 401: // User authentication failed
      case 403: // User denied permission
      case 404: // Endpoint or record not found
      case 500: // Server error
      default:
        return ApiResponse._(status: Status.error, code: response.statusCode, message: null, data: response.data);
    }
  }
}
