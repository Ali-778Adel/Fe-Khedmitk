import 'package:dio/dio.dart';
import 'package:khadamatic_auth/constants/constants.dart';

class AuthenticationDioHelper {
  static Dio? dio;

  static void initAuthDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://cleaning.3m-erp.com/khadamaty/api',
          receiveDataWhenStatusError: true,
          headers: {'Accept': 'application/json',
          }),
    );
    print ('dio is not equall null');
  }
//send user auth data
  static Future<Response> sendUserData(
      {required String url,
      required Map<String, dynamic> data,
      String? token}) async {
    dio!.options.headers = { 'Authorization':'Bearer ${token}'};
    return await dio!.post(url, data: data).catchError((error){
      print('error in send data in dio package${error.toString()}');
    });
  }

  static Future<Response> getTechnicalProfile(
      {
        required String url
      }
      )async{
    return await dio!.get(url
        ,options:Options(
            headers: {'Authorization':'Bearer ${token}'},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }
        )).catchError((error){print('error on get technicalProfileData${error.toString()}');});
  }
  static Future<Response> getAllTechnicalOrders(
      {
        required String url
      }
      )async{
    return await dio!.get(url
        ,options:Options(
            headers: {'Authorization': 'Bearer ${token}'},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }
        )).catchError((error){print('error on get technicalProfileData${error.toString()}');});
  }
  static Future<Response> getTechnicalSuccessedOrders(
      {
        required String url
      }
      )async{
    return await dio!.get(url
        ,options:Options(
            headers: {'Authorization': 'Bearer ${token}'},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }
        )).catchError((error){print('error on get technicalProfileData${error.toString()}');});
  }
  static Future<Response> getTechnicalCanceledOrders(
      {
        required String url
      }
      )async{
    return await dio!.get(url
        ,options:Options(
            headers: {'Authorization': 'Bearer ${token}'},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }
        )).catchError((error){print('error on get technicalProfileData${error.toString()}');});
  }
  static Future<Response> offerDeal(
      {required String url,
        required Map<String, dynamic> data,
        String? token}) async {
    dio!.options.headers = { 'Authorization': 'Bearer ${token}'};
    return await dio!.post(url, data: data).catchError((error){
      print('error in send data in dio package${error.toString()}');
    });
  }
}
