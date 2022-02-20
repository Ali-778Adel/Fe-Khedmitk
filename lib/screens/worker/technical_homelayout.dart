import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/worker/worker_homepage_cubit.dart';
import 'package:khadamatic_auth/cubit_states/worker/worker_homepage_states.dart';
import 'package:khadamatic_auth/widgets/worker_widgets/bottom_nav_bar.dart';
class TechnicalHomePage extends StatelessWidget {
  const TechnicalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:BlocBuilder<WorkerHomePageCubit,WorkerHomepageStates>(
        builder: (context,state){
          return IndexedStack(
            index: context.read<WorkerHomePageCubit>().currentIndex,
            children:context.read<WorkerHomePageCubit>().widgetsgenerated ,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<WorkerHomePageCubit,WorkerHomepageStates>(
          builder: (context,state) {
          return CustomNavBarWidget(
            selectedIndex: context.read<WorkerHomePageCubit>().currentIndex,
          onItemSelected: (index){
              context.read<WorkerHomePageCubit>().onBottomNavBatTapped(index);
          },
          );
        }
      ),
    );
  }
}
