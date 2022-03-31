import 'dart:core';

import 'package:dio/dio.dart';

class ToggleApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';

  static String apiUrl =
      'https://b9d5-2401-4900-230a-949f-b01b-ffc4-c13b-2ba4.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<String> ToogleStatus(String colls, int value) async {
    final response = await _dio
        .post('/updateToggleStatus', data: {"colls": colls, "value": value});
    return "Success";
  }
  
  Future<String> getCurrentToogleStatus(String colls) async {
    final response = await _dio.post('/getCurrentProfileStatus', data: {
      "colls":colls
    });
    return response.toString();
  }
}
