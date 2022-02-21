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
    dio!.options.headers = { 'Authorization': token};
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
            headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTA1YzgxYmRlYzg4NjBhZDRlOGI2MzI2ODY3ZDEwODhmZDdiNWE3Y2M3MjNiYmI1MWYxZmI2NDMyMWY2YmQyZmMzZGI0N2ZlNmY3NTE1MWEiLCJpYXQiOjE2NDUwNjAxMjQsIm5iZiI6MTY0NTA2MDEyNCwiZXhwIjoxNjc2NTk2MTI0LCJzdWIiOiI5MiIsInNjb3BlcyI6W119.bmA4cPbf-iH9P3D03GE_Zoaut16EN60gdOcxdC-xVhEbNQ83lDkmQ4xH6jy2ecL1ZcgJqiQAWYjVP9hPM39-1bwSqwxeeEkExHolj7HjN0t4Seg9hpv_tq0wvWvuKw64eXQp0OuAi6J3a7yASjqa61Hr4SeUvSAzcMrRK78lpl0hFdr_peDxbkYV8p6aOyRutII4I9hPagVDsO-yIcLMdMaYhSUwzmUEB2ktGccOTRJnKrk-sc_9bQF6q6RIDQ8LITxeI6juIJJgllLq_wZksR9NLMo9aLM1xhJhmlT6dLtzSZY68sJKR8b25aZJ812wOjbU-7fZtK_2JVrsjG_0vzwrIRqaUbKzJi0v9C-rmftfDsmJ2dx8vZ-zA2ah71N8dfvwmkmeio0j8L6oEtOHX9Ej_zJtjRVwg_Ma8jUbs6vdL2FYcxrMkfNqRUmIfaq1qNXwvflsnpzqdtpLCRuxPQfBEYyXNcFEzWmP6KWakqTiuiEbGthmGTYUMJdAALWKkNoGKWwrqekUWIO1nsOq2r14Xj1ItBd9Om8fGo1Z2E301M7ZJIRblKRnjSGmfl7iK5iYdpxSTJUK9vct7q11zUSMvIleWu0fdqRUX6KcAZet8uuHDKD1yQ0KsTk5bPZynGBuNqGKTX8HdY6kyk3uYVq2B8fadbJrLa69GK_oYJs'},
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
