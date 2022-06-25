import 'dart:core';

import 'package:dio/dio.dart';

class ExportDataApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';

  static String apiUrl = 'https://sjit-placement-portal-admin.herokuapp.com';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<String> sendDataToMail(
      String colName, String batch, String mailId) async {
    final response = await _dio.post('/sendDataToMail',
        data: {'colName': colName, 'batch': batch, 'mailId': mailId});
    String finalResponse = response.toString();
    return finalResponse;
  }
}
