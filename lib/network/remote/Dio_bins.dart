
import 'package:dio/dio.dart';

class BinsDioHelper {

  static Dio? dio ;

  static init()
  {
    dio =  Dio(
        BaseOptions(
            baseUrl: 'https://salla-tarsh-eltarsh.onrender.com/api/' ,
            receiveDataWhenStatusError: true
        )
    );
  }

  static Future<Response> getData({required String url ,  Map<String,dynamic>? query}) async
  {
    return await dio!.get(url , queryParameters:query);
  }

}