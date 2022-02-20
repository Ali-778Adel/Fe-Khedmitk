import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit_states/worker/settings/technical_profile_cubit_states.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

import '../../../models/technical_profile_data_model.dart';
class TechnicalProfileCubit extends Cubit<TechnicalProfileStates>{
  TechnicalProfileCubit() : super(TPInitState());
  static TechnicalProfileCubit get(context)=>BlocProvider.of(context);
  TechnicalProfileDataModel?technicalProfileDataModel;

  //getTechnicalProfileDataMethod

 getTechnicalProfileData()async{
  emit(GetTechnicalDataLoadingState());
   await  AuthenticationDioHelper.getTechnicalProfile(url: TechnicalProfile).then((value) {
     technicalProfileDataModel=TechnicalProfileDataModel.fromJson(value.data);
     print(technicalProfileDataModel!.data!.description);
     print(technicalProfileDataModel!.data!.description);
    print ('i am getting dadt now ');
    print(value.statusMessage);
    print(value.data.toString());
    print(value.statusMessage);
    emit(GetTechnicalDataSuccessState());
  }).catchError((error){
    print('error on get technical profile data ${error.toString()}');
    emit(GetTechnicalDataFailureState());
  }).onError((error, stackTrace) {
    print(stackTrace);
   });
}
}