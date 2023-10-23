import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio ;
  static init()
  {
     dio = Dio(
       BaseOptions(
         baseUrl: 'http://mark.bslmeiyu.com/' ,
         receiveDataWhenStatusError: true ,
       )
     );
  }

  static Future<Response> getData({ required String url , Map<String , dynamic>? query }) async
  {
    return await dio.get(url ,queryParameters: query , );
  }
}