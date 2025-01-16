import 'package:dio/dio.dart';

class DioHelper {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  DioHelper(this._dio);
  Future<Map<String,dynamic>>  get ({
    Map<String,dynamic>? queries,
    required String url,
    

})async {


    var response= await _dio.get(
    '$_baseUrl$url',
    queryParameters: queries,

    );
    return response.data;

  }
}