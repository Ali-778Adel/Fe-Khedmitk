import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit/order_cubit/order_states.dart';
import 'package:khadamatic_auth/models/order_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

class OrderCubit extends Cubit<OrderStates>{
  OrderCubit():super (InitialOrderState());

  static OrderCubit get(context)=> BlocProvider.of(context);

  OrderModel? orderModel;

  void createOrder({required int serviceID,required String customerNote,
    required String address,required String time,required String date,
  required int subCategoryID,}){
    emit(PostOrderLoading());
    AuthenticationDioHelper.dio!.post(requestOrder,data: {
      'service_id':serviceID,
      'sub_category_id':subCategoryID,
      'address':address,
      'time':time,
      'date':date,
      'notes':customerNote,
    },options: Options(
      headers: {'Accept':'application/json','Authorization':'Bearer '
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNWRjNjNiZjNlNmMyMzg5YjhlNWE4MDdhNGQyMGI5Y2RhMzIxN2I1NTU1ZDI0MzUxODdkYTMxY2I3MzQzZjk3MTNlODYzN2EwN2E1OWUwZTIiLCJpYXQiOjE2NDUzNzEyNTksIm5iZiI6MTY0NTM3MTI1OSwiZXhwIjoxNjc2OTA3MjU5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.HuyA3cyV9r2JoSeViF_GGytv3kgmmNBP2aSmKouc835AFY5WowND_ofbPGEWqLRyqDbRbcl9-1ASAW39hFiOzFMQDj5iq5Snk_q_ZK-5fOiYm_n2mHSwM0jgVi5OX3dcmxjALEMGxmAR4C1kcpmE1oMqkwZK1gw4rV9Q1mHY6ZGOrQ7kyjhEYxgYHuw_n8Xopzh5rEPPZ0oqwgrewIbZtGpfdjgP8ehTSQIURnKfLgfQ_rpP-bUxk-UuT3sCH6szjULaNpr_JZ95ueECK1Qjh0PyltRFOUB7kGN7qlBMd69ub1S5gi5CX8mP8kvh8RopMN6gYqcrVmeRBQ_HxtyxxSQtKZqI5VeMC_Gc8C3atvVg66E-mJS8NJ4gR5VFekeKzHYzZPpYfOuXA3blQ-pGxj6_mV7A-u9Gs3BYrxw1CXGVOxczufLplf5hS-65h7EPriddaNHm-D5TZZ6R2pn2XYVGp5SxJFQi-YBkU1Na2x4bCrdPuq9klkJYDTYNZPXqoXqKHp0OBiEwkrUHm6qF3yQm9JkovQl9Z48aV7NbKwxnVPjyDWpe9lxEL4Codc60JzOElggJdZ6YqWGSiVYu8lRupUwUrWtxZWNQRib9-9pK9RuA0CWDHUSiHYgMxpwwMgzGJv6xGRROPw1K4_YHDaMWcqzzZaz5W5pHdwBnpXw',},
    )).then(
            (value) {
      print(value.data);
      orderModel = OrderModel.fromJson(value.data);
      emit(PostOrderSuccess(orderModel!));
    }).catchError((error){
      print(error.toString());
      emit(PostOrderError(error.toString()));
    });
    
  }
}