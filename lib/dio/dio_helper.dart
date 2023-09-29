import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://dot-tv.net/",
      receiveDataWhenStatusError: true,
      headers: {"Accept": "application/json", "Content-Type": "application/json"},
    ));
  }

  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    return await dio.get(url);
  }

  static Future<Response> postData({
    required String url,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    return dio.post(url, data: data);
  }

  static Future<Response> putData({
    required String url,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    return dio.put(url, data: data);
  }

  static Future<Response> deleteData({
    required String url,
    String? token,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    return dio.delete(
      url,
    );
  }

  static Future<Response> uploadData({
    required String url,
    String? token,
    required var data,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    return dio.post(url, data: data);
  }
}
