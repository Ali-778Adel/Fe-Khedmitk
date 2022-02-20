import 'package:dio/dio.dart';

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
            headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWNhM2M4NDg2NzY3ODlhNTIzMTEyY2I3ZDYyYjcwZjhlNzk4NWQ2OWY4Yjc3ZjI0NGViNzIyY2Q4ZjZlYWM0MWQwNjdkZjFlMmI2YjkzNDIiLCJpYXQiOjE2NDUzNjQ5NzksIm5iZiI6MTY0NTM2NDk3OSwiZXhwIjoxNjc2OTAwOTc5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.cYiq_H8pa1i7jZLWOUbgQIkFVpkT3Es3Coxi1njo0B5uR1Qazbh3dKJkF2zXh1rtfwdXcXIlHY6xdjQZrNL_OOIoQ_sSEN586CmujnKcQJu7A_hr-bgVNrcmR5sfHC2Lq9hjvWPfPE27adw_zrUlDoPb7Fg08yrxptOK8QVJzX6lCS-m8HG5JRnmLI06P6JFiU6i3r9t6HGTriWT77U3u-pAmjDm91F6EVoobMq110vPWRqy9FMcU9w5iS_nvzDlOBMv7ORPpIapo_MLV3X1DowosujmYqOfCCm-HRxCDtr-eXioDSMmR-ky_LIbJkMQ_j7MCZnY2NCvgwCp9HbEssNn6u3yHL2R6mtgyNnfSqOL9b9MXEVz2F5Wqn8tjHCmGsqN7f2kQNUJ6BysL_dCHZLAUIKetv-NcDwbgWPLppDK-_-7r8XnU4rLO4grMUZJ3a_OqxN-EOjgcf03ybWd85p56zeRGVT60Tdm369nXs5Ja28QkXn4_lsY3Xs0G1G_Y0LvVLFNah0-L7raNL6h0er5EVSDlt5o9kxu4K6N_CqXHuZWrk2U40obLyif2E77AWwI4UKSgO-J01j2U9TaptsqxmtqQMhLdCb7zih19L0V8KwhPcGfvY0NAymxiwVnDx1-DvhUIGM3GVDEv6ULk31zErWrN2r-6uDqhlefndo'},
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
            headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWNhM2M4NDg2NzY3ODlhNTIzMTEyY2I3ZDYyYjcwZjhlNzk4NWQ2OWY4Yjc3ZjI0NGViNzIyY2Q4ZjZlYWM0MWQwNjdkZjFlMmI2YjkzNDIiLCJpYXQiOjE2NDUzNjQ5NzksIm5iZiI6MTY0NTM2NDk3OSwiZXhwIjoxNjc2OTAwOTc5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.cYiq_H8pa1i7jZLWOUbgQIkFVpkT3Es3Coxi1njo0B5uR1Qazbh3dKJkF2zXh1rtfwdXcXIlHY6xdjQZrNL_OOIoQ_sSEN586CmujnKcQJu7A_hr-bgVNrcmR5sfHC2Lq9hjvWPfPE27adw_zrUlDoPb7Fg08yrxptOK8QVJzX6lCS-m8HG5JRnmLI06P6JFiU6i3r9t6HGTriWT77U3u-pAmjDm91F6EVoobMq110vPWRqy9FMcU9w5iS_nvzDlOBMv7ORPpIapo_MLV3X1DowosujmYqOfCCm-HRxCDtr-eXioDSMmR-ky_LIbJkMQ_j7MCZnY2NCvgwCp9HbEssNn6u3yHL2R6mtgyNnfSqOL9b9MXEVz2F5Wqn8tjHCmGsqN7f2kQNUJ6BysL_dCHZLAUIKetv-NcDwbgWPLppDK-_-7r8XnU4rLO4grMUZJ3a_OqxN-EOjgcf03ybWd85p56zeRGVT60Tdm369nXs5Ja28QkXn4_lsY3Xs0G1G_Y0LvVLFNah0-L7raNL6h0er5EVSDlt5o9kxu4K6N_CqXHuZWrk2U40obLyif2E77AWwI4UKSgO-J01j2U9TaptsqxmtqQMhLdCb7zih19L0V8KwhPcGfvY0NAymxiwVnDx1-DvhUIGM3GVDEv6ULk31zErWrN2r-6uDqhlefndo'},
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
            headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWNhM2M4NDg2NzY3ODlhNTIzMTEyY2I3ZDYyYjcwZjhlNzk4NWQ2OWY4Yjc3ZjI0NGViNzIyY2Q4ZjZlYWM0MWQwNjdkZjFlMmI2YjkzNDIiLCJpYXQiOjE2NDUzNjQ5NzksIm5iZiI6MTY0NTM2NDk3OSwiZXhwIjoxNjc2OTAwOTc5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.cYiq_H8pa1i7jZLWOUbgQIkFVpkT3Es3Coxi1njo0B5uR1Qazbh3dKJkF2zXh1rtfwdXcXIlHY6xdjQZrNL_OOIoQ_sSEN586CmujnKcQJu7A_hr-bgVNrcmR5sfHC2Lq9hjvWPfPE27adw_zrUlDoPb7Fg08yrxptOK8QVJzX6lCS-m8HG5JRnmLI06P6JFiU6i3r9t6HGTriWT77U3u-pAmjDm91F6EVoobMq110vPWRqy9FMcU9w5iS_nvzDlOBMv7ORPpIapo_MLV3X1DowosujmYqOfCCm-HRxCDtr-eXioDSMmR-ky_LIbJkMQ_j7MCZnY2NCvgwCp9HbEssNn6u3yHL2R6mtgyNnfSqOL9b9MXEVz2F5Wqn8tjHCmGsqN7f2kQNUJ6BysL_dCHZLAUIKetv-NcDwbgWPLppDK-_-7r8XnU4rLO4grMUZJ3a_OqxN-EOjgcf03ybWd85p56zeRGVT60Tdm369nXs5Ja28QkXn4_lsY3Xs0G1G_Y0LvVLFNah0-L7raNL6h0er5EVSDlt5o9kxu4K6N_CqXHuZWrk2U40obLyif2E77AWwI4UKSgO-J01j2U9TaptsqxmtqQMhLdCb7zih19L0V8KwhPcGfvY0NAymxiwVnDx1-DvhUIGM3GVDEv6ULk31zErWrN2r-6uDqhlefndo'},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }
        )).catchError((error){print('error on get technicalProfileData${error.toString()}');});
  }
}
