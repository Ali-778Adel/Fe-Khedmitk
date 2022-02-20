import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/cubit/worker/worker_homepage_cubit.dart';

import '../../../cubit_states/worker/worker_homepage_states.dart';
import '../../../widgets/worker_widgets/technical_order_content_item.dart';
class AllTechnicalTransactionScreen  extends StatelessWidget {
  const AllTechnicalTransactionScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child:  BlocBuilder<WorkerHomePageCubit,WorkerHomepageStates>(
        builder: (context,state){
          WorkerHomePageCubit workerHomePageCubit=WorkerHomePageCubit.get(context);
          return ListView.builder(
              itemExtent: 200,
              itemCount:0 ,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                if(state is GetTechnicalSuccessOrdersLoadingState ||state is GetTechnicalCanceledOrdersLoadingState ){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(workerHomePageCubit.technicalSuccessOrdersModel!.data!.data !=null && workerHomePageCubit.technicalCanceledOrdersModel!.data!.data !=null) {
                  return CustomTechnicalOrderContentItem(
                    name:workerHomePageCubit.technicalSuccessOrdersModel!.data!.data![0] ,
                    total:workerHomePageCubit.technicalSuccessOrdersModel!.data!.data![1]  ,
                    decription: workerHomePageCubit.technicalSuccessOrdersModel!.data!.data![2]  ,
                    address:workerHomePageCubit.technicalSuccessOrdersModel!.data!.data![3]  ,

                  );
                }else{
                  return const Center(child: Text('no orders yet.... ',
                    style: TextStyle(color: KMainColor,fontSize: 22),),);
                }
                });
        },
      ),
    );}}