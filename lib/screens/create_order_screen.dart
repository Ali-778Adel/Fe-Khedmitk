import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/order_cubit/order_cubit.dart';
import 'package:khadamatic_auth/cubit/order_cubit/order_states.dart';
import 'package:khadamatic_auth/screens/app_layout.dart';

import '../components/ToastMessage.dart';
import '../constants/constants.dart';

class CreateOrderScreen extends StatefulWidget {
   CreateOrderScreen({Key? key, required this.serviceID, required this.serviceName}) : super(key: key);
   final int serviceID;
   final String serviceName;


   @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  var formKey = GlobalKey<FormState>();
  int currentStep = 0;
  bool isCompleted = false;
  var addressController = TextEditingController();
  var customerNoteController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  OrderCubit(),
      child: BlocConsumer<OrderCubit,OrderStates>(
        listener: (context, state) {

        },
        builder: (context,state){
          return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.serviceName,style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,color: KMainColor),),
                  SizedBox(height: 20),
                  Form(
                  key:formKey ,
                  child: Column(
                  children: [
                  TextFormField(controller: customerNoteController,
                    maxLines: 10,
                    minLines: 10,
                  decoration: InputDecoration(

                  //     contentPadding: const
                  // EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
                      hintText: 'Describe your '
                  'require task',border: OutlineInputBorder
                  (borderRadius: BorderRadius.circular(20))),),
                  SizedBox(height: 20,),
                  TextFormField(controller: addressController,
                  decoration: InputDecoration(hintText: 'Enter '
                      'your home '
                  'address',
                      border: OutlineInputBorder
                  (borderRadius: BorderRadius.circular(20))),),

                  ],
                  ),
                  ),///Button
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        OrderCubit.get(context).createOrder(serviceID: widget
                            .serviceID.toString(), customerNote: customerNoteController
                            .text,
                            address: addressController.text, time:
                        TimeOfDay.now().toString(), date: DateTime.now().toString(),
                            subCategoryID:
                            2.toString());
                        if( state is PostOrderSuccess){
                          HandleToastMeaasge.showToastMessage
                            (context:context,message: state.orderModel
                              .message!,
                              enumState:
                          EnumState.SUCCESS);

                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AppLayout(),),
                                  (route) => false);
                        }

                        if(OrderCubit.get(context).orderModel == null&& state
                        is PostOrderError){
                          HandleToastMeaasge.showToastMessage
                            (context:context,message: state.error,
                              enumState:
                              EnumState.ERROR);

                          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AppLayout(),),
                          //         (route) => false);
                        }
                      },
                      child: Text('Order Now', style: TextStyle(color: KMainColor)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1, color: KMainColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  List<Step> getSteps ()=>[
    Step(content: Container(), title: Text('')),
    Step(content: Container(), title: Text('')),
    Step(content: Container(), title: Text('')),
  ];

  // Form(
  // key:formKey ,
  // child: Padding(
  // padding: const EdgeInsets.all(15.0),
  // child: Column(
  // children: [
  // TextFormField(controller: customerNoteController,
  // decoration: InputDecoration(hintText: 'Describe your '
  // 'require task',border: OutlineInputBorder
  // (borderRadius: BorderRadius.circular(20))),),
  // TextFormField(controller: addressController,
  // decoration: InputDecoration(border: OutlineInputBorder
  // (borderRadius: BorderRadius.circular(20))),),
  //
  // ],
  // ),
  // ),
  // ),
}
