import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit/transaction_cubit/transaction_states.dart';
import 'package:khadamatic_auth/models/client_orders_model.dart';
import 'package:khadamatic_auth/models/client_profile_model.dart';
import 'package:khadamatic_auth/models/get_offers_deal_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

class TransactionCubit extends Cubit<TransactionStates>{

  TransactionCubit():super(InitialTransactionState());

  static TransactionCubit get(context)=>BlocProvider.of(context);

  ClientOrdersModel? clientOrdersModel;
  
  void getClientOrders(){
    AuthenticationDioHelper.dio!.get(allClientOrders,options: Options(headers:
    {
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    },)).then((value) {
//print(value.data);
clientOrdersModel = ClientOrdersModel.fromJson(value.data);
print(clientOrdersModel);
emit(GetTransactionSuccess(clientOrdersModel!));
    }).catchError((error){
      print(error.toString());
      emit(GetTransactionError(error.toString()));
    });
    
  }
  Color changeTransactionColor(DataClientOrders model){
    if(model.orderType!.type=='finished'){
      return Colors.green;
    }
    else if(model.orderType!.type=='pending'){
      return KJobColor;
    }
    else if(model.orderType!.type =='canceled'){
      return Colors.red;
    }
    else{
      return Colors.white;
    }
  }
  ClientProfileModel? clientProfileModel;
  void getClientProfile(){
    AuthenticationDioHelper.dio!.get(clientProfile,options: Options(headers:
    {'Accept':'application/json','Authorization':'Bearer $token',},)).then(
            (value) {
              clientProfileModel = ClientProfileModel.fromJson(value.data);
              emit(GetClientProfileSuccess(clientProfileModel!));
            }).catchError((error){
              print(error.toString());
              emit(GetClientProfileError(error.toString()));
    });
  }
  GetOffersDealModel? getOffersDealModel;
  void getOffersDeal(num orderID){
    emit(GetOffersDealLoading());
    AuthenticationDioHelper.dio!.get(getOffersDealEndPoint,options: Options
      (headers: {'Accept':'application/json','Authorization':'Bearer $token',},
    ),queryParameters: {
      'order_id':orderID,
    }).then((value) {
      getOffersDealModel = GetOffersDealModel.fromJson(value.data);
      print(value.data);
      emit(GetOffersDealSuccess(getOffersDealModel!));

    }).catchError((error){
      print(error.toString());
      emit(GetOffersDealError(error.toString()));

    });
  }
}