import 'dart:core';

import 'package:dio/dio.dart';

class NotificationApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sjit-admin.herokuapp.com'

  static String apiUrl = 'https://sjit-placement-portal-admin.herokuapp.com';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<String>> getTokenIdByBatch(String batch) async {
    final response =
        await _dio.post('/getTokenIdByBatchNew', data: {"batch": batch});
    List<dynamic> iter_res = response.data["token"];
    List<String> reslist = [];
    int i;
    for (i = 0; i < iter_res.length; i++) {
      reslist.add(iter_res[i].toString());
    }
    return reslist;
  }

  Future<String> storeNotification(String heading, String message, String batch) async {
    print("Success");
      final response = await _dio.post('/storeNotification',
          data: {"heading": heading, "message": message, "batch": batch});
      return "Success";
  }
}
