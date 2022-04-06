import 'dart:core';

import 'package:dio/dio.dart';

class ToggleApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';

  static String apiUrl = 'https://d5c5-183-82-178-157.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<String> toggleStatus(String colls, int value) async {
    final response = await _dio
        .post('/updateToggleStatus', data: {"colls": colls, "value": value});
    return "Success";
  }

  Future<String> getCurrentToogleStatus(String colls) async {
    final response =
        await _dio.post('/getCurrentToggleStatus', data: {"colls": colls});
    return response.toString();
  }
}
