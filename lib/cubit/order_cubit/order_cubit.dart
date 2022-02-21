import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit/order_cubit/order_states.dart';
import 'package:khadamatic_auth/models/order_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

import '../../models/service_model.dart';

class OrderCubit extends Cubit<OrderStates>{
  OrderCubit():super (InitialOrderState());

  static OrderCubit get(context)=> BlocProvider.of(context);

  OrderModel? orderModel;
  ServiceModel? serviceModel;

  void createOrder({required String serviceID,required String customerNote,
    required String address,required String time,required String date,
  required String subCategoryID,}){
    emit(PostOrderLoading());
    print(serviceID);
    print(subCategoryID);
    print(customerNote);
    print(date);
    print(address);
    print(time);
    AuthenticationDioHelper.dio!.get(service+'/2',options: Options(
        headers: {'Accept':'application/json','Authorization':'Bearer $token',})
    ).then((value) {
      serviceModel = ServiceModel.fromJson(value.data);
      AuthenticationDioHelper.dio!.post(requestOrder,data: {
        'service_id': serviceModel!.data![0].id.toString(),
        'sub_category_id': subCategoryID,
        'date': DateTime.now().toString(),
        'time': DateTime.now().toString(),
        'notes': customerNote,
        'address': address,
        'lat': '29.1931',
        'long': '30.6421',
        'payment_type_id': '2',

      },options: Options(
          headers: {'Accept':'application/json','Authorization':'Bearer $token',})).then(
              (value) {
            print(value.data);
            orderModel = OrderModel.fromJson(value.data);
            emit(PostOrderSuccess(orderModel!));
          }).catchError((error){
        print(error.toString());
        emit(PostOrderError(error.toString()));
      });
    });

    
  }
}