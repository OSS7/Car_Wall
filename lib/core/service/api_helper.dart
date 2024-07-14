import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiHelper {
  static Future<dynamic> get(String url) async {
    final dio = Dio();
    try{
      final response = await dio.get(
        url,
        // headers: {
        //   'lang': currentLang(),
        //   'Authorization': 'Bearer $token',
        // },
      );
      return response.data;
    } catch(issue){
      throw 'no internet';
    }


  }

  static Future<dynamic> put(String url, {Map<String, dynamic>? params}) async {
    final responseJson;
    final dio = Dio();
    // print('put $url');
    // print('body $params');
    // print(token);
    // dio.options.headers = {
    //   'lang': currentLang(),
    //   'Authorization': 'Bearer $token',
    //   'Content-Type': 'application/json',
    // };

    try {
      final body = json.encode(params);
      final response = await dio.put(url, data: body);
      responseJson = response.data;
    } on SocketException {
      throw 'No Internet connection';
    }

    return responseJson;
  }
}
