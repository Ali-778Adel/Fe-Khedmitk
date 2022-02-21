import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit_states/worker/worker_homepage_states.dart';
import 'package:khadamatic_auth/models/technical_canceld_order_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import '../../models/all_technical_order_model.dart';
import '../../models/technical_success_orders_model.dart';
import '../../screens/worker/bottomnavbar_related_screen/all_technical_transaction.dart';
import '../../screens/worker/bottomnavbar_related_screen/technical_home_page.dart';
import '../../screens/worker/bottomnavbar_related_screen/tecnical_all_orders_screen.dart';
import '../../screens/worker/settings/settings_screen.dart';


class WorkerHomePageCubit extends Cubit<WorkerHomepageStates>{
  WorkerHomePageCubit():super(WHInitState());
  //initialize WorkerHomePageCubit for static usage across whole app
  static WorkerHomePageCubit get(context){
    return BlocProvider.of(context);
  }//
  AllTechnicalOrdersModel?allTechnicalOrdersModel;
  TechnicalCanceledOrdersModel?technicalCanceledOrdersModel;
  TechnicalSuccessOrdersModel?technicalSuccessOrdersModel;

  List<Widget>widgetsgenerated=[
    const TechnicalHomeScreen(),
    const TechnicalAllOrdersScreen(),
    const AllTechnicalTransactionScreen(),
    const SettingsScreen(),
  ];
//onBottomNavBatTapped method

//onBottomNavBatTapped method
  int currentIndex=0;
  onBottomNavBatTapped(int?index){
    currentIndex=index!;
    print(currentIndex);
    emit(OnBottomNavBarItemSelectedState());
  }

  //get technical all orders
 getTechnicalAllOrders()async{
    emit( GetTechnicalAllOrdersLoadingState ());
  await AuthenticationDioHelper.getAllTechnicalOrders(url: AllTechnicalOrders).then((value) {
     allTechnicalOrdersModel= AllTechnicalOrdersModel.fromJson(value.data);
     print(allTechnicalOrdersModel!.data![0].address);
     emit(GetTechnicalAllOrdersSuccessState());
  }).catchError((error){
    emit(GetTechnicalAllOrdersFailureState());
    print ('error on getTechnicalAllOrders methos ${error.toString()} ');
  });
 }
 //getTechnicalSuccessOrders
  getTechnicalSuccessOrders()async{
    emit( GetTechnicalSuccessOrdersLoadingState ());
    await AuthenticationDioHelper.getTechnicalSuccessedOrders(url: TechnicalSuccessOrder).then((value) {
      technicalSuccessOrdersModel=TechnicalSuccessOrdersModel.fromJson(value.data);
      print(technicalSuccessOrdersModel!.data!.data![0]);
      emit(GetTechnicalSuccessOrdersSuccessState());
    }).catchError((error){
      print ('error on getTechnicalSuccessOrders method ${error.toString()} ');
      emit(GetTechnicalSuccessOrdersFailureState());
    });

  }
  getTechnicalFailedOrders()async{
    emit( GetTechnicalCanceledOrdersLoadingState ());
    await AuthenticationDioHelper.getTechnicalCanceledOrders(url: TechnicalCanceledOrder).then((value) {
      technicalCanceledOrdersModel=TechnicalCanceledOrdersModel.fromJson(value.data);
      print(technicalCanceledOrdersModel!.data!.data![0]);
      emit(GetTechnicalCanceledOrdersSuccessState());
    }).catchError((error){
      print ('error on getTechnicalFailedOrders method ${error.toString()} ');
      emit(GetTechnicalCanceledOrdersFailureState());

    });

  }
  acceptOffer({String?total}){
    emit(AcceptOfferLoadingState());
AuthenticationDioHelper.offerDeal(url: OferOrder,
data: {'order_id':'9',
    'total':'$total'}
    ).then((value) {
      print('accept offer return ${value.data}');
      emit(AcceptOfferSuccessState());
}).catchError((error){print('error on send offer data');emit(AcceptOfferFailureState());});

  }
}