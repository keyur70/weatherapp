import 'package:dio/dio.dart';
import 'package:weatherapp_demo/const/api_url.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: ApiUrl.baseUrl,
            ));

  // Get Api Method
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException {
      // Handle Dio error

      rethrow; // or handle accordingly
    }
  }
}
