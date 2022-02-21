import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/cubit/worker/worker_homepage_cubit.dart';
import '../../../cubit_states/worker/worker_homepage_states.dart';
import '../../../widgets/worker_widgets/technical_order_content_item.dart';
class TechnicalAllOrdersScreen  extends StatelessWidget {
  const TechnicalAllOrdersScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child:  BlocBuilder<WorkerHomePageCubit,WorkerHomepageStates>(
        builder: (context,state){
          WorkerHomePageCubit workerHomePageCubit=WorkerHomePageCubit.get(context);
          return ListView.builder(
              itemExtent: 200,
              itemCount: workerHomePageCubit.allTechnicalOrdersModel!.data!.length,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                if(state is GetTechnicalAllOrdersLoadingState ){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is GetTechnicalAllOrdersSuccessState){
                  if(workerHomePageCubit.allTechnicalOrdersModel!.data!.isNotEmpty) {
                    return CustomTechnicalOrderContentItem(
                      name:workerHomePageCubit.allTechnicalOrdersModel!.data![index].client!.name ,
                      total:workerHomePageCubit.allTechnicalOrdersModel!.data![index].total ,
                      decription: workerHomePageCubit.allTechnicalOrdersModel!.data![index].service!.nameAr ,
                      address:workerHomePageCubit.allTechnicalOrdersModel!.data![index].address ,

                    );
                  }else{
                    return const Center(child: Text('no orders yet.... ',
                      style: TextStyle(color: KMainColor,fontSize: 22),),);
                  }
                }else{
                  return  const Center(child: Text('no orders yet.... ',
                    style: TextStyle(color: KMainColor,fontSize: 22),),);
                }



              });
        },
      ),
    );}}