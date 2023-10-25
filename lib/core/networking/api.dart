import 'package:dio/dio.dart';
import 'package:scale3c_homework/core/networking/api_response.dart';

typedef RequestParameters = Map<String, dynamic>;
typedef RequestBody = Map<String, dynamic>;
typedef RequestHeaders = Map<String, dynamic>;

class API {
  final String baseUrl;
  final RequestHeaders headers;
  final bool useHttps;
  final Dio _dio;
  final Options _options;

  API({
    required this.headers,
    required this.baseUrl,
    this.useHttps = true,
  })  : _dio = Dio(),
        _options = Options(
          headers: headers,
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          validateStatus: (status) {
            return (status ?? 0) <= 500;
          },
        );

  Future<ApiResponse> get(
    String endpoint, {
    RequestParameters? parameters,
    CancelToken? cancelToken,
  }) {
    return _errorHandlingWrapper(() {
      return _dio.get(
        _formatUrl(endpoint, parameters),
        cancelToken: cancelToken,
        options: _options,
      );
    });
  }

  Future<ApiResponse> post(
    String endpoint, {
    RequestParameters? parameters,
    RequestBody? body,
    CancelToken? cancelToken,
  }) {
    return _errorHandlingWrapper(() {
      return _dio.post(
        _formatUrl(endpoint, parameters),
        data: body,
        cancelToken: cancelToken,
        options: _options,
      );
    });
  }

  String _formatUrl(String endpoint, [RequestParameters? parameters]) {
    if (useHttps) {
      return Uri.https(baseUrl, endpoint, parameters).toString();
    }

    return Uri.http(baseUrl, endpoint, parameters).toString();
  }

  Future<ApiResponse> _errorHandlingWrapper(Future<Response> Function() request) async {
    try {
      return ApiResponse.fromResponse(await request());
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
