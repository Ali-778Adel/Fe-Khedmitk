import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/order_cubit/order_cubit.dart';
import 'package:khadamatic_auth/cubit/order_cubit/order_states.dart';

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
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.serviceName),
                Form(
                key:formKey ,
                child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                children: [
                TextFormField(controller: customerNoteController,
                decoration: InputDecoration(hintText: 'Describe your '
                'require task',border: OutlineInputBorder
                (borderRadius: BorderRadius.circular(20))),),
                TextFormField(controller: addressController,
                decoration: InputDecoration(border: OutlineInputBorder
                (borderRadius: BorderRadius.circular(20))),),

                ],
                ),
                ),
                ),
                OutlinedButton(
                  onPressed: () {
                    OrderCubit.get(context).createOrder(serviceID: widget
                        .serviceID, customerNote: customerNoteController.text, 
                        address: addressController.text, time: 
                    TimeOfDay.now().toString(), date: DateTime.now().toString(),
                        subCategoryID:
                        2);
                  },
                  child: Text('Order Now', style: TextStyle(color: KMainColor)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1, color: KMainColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ],
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
