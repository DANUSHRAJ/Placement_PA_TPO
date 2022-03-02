import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';

class FormsApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';

  static String apiUrl = 'http://127.0.0.1:8080';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<String> uploadForm(dynamic JSONdata) async {
    final response = await _dio.post('/uploadForm', data: JSONdata);
    return "Success";
  }
}
