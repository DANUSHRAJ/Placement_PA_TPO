import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';

class FormsApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';

  static String apiUrl = 'https://72e7-2402-3a80-19a0-8d1a-18a-6497-fece-24c6.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<String> uploadForm(dynamic JSONdata) async {
    final response = await _dio.post('/uploadForm', data: JSONdata);
    return "Success";
  }
//Future<Response<dynamic>>
  dynamic downloadForm() async {
    var result = await _dio.post('/downloadForm');
    return result;
    // final Response<dynamic> response = await _dio.post('/downloadForm');
    // return response;
  }
}
