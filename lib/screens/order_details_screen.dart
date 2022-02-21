import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/cubit/home_cubit/home_cubit.dart';
import 'package:khadamatic_auth/cubit/transaction_cubit/transaction_cubit.dart';
import 'package:khadamatic_auth/cubit/transaction_cubit/transaction_states.dart';
import 'package:khadamatic_auth/models/best_tech_model.dart';
import 'package:khadamatic_auth/models/client_orders_model.dart';
import 'package:khadamatic_auth/models/get_offers_deal_model.dart';

import '../cubit/home_cubit/home_states.dart';

class OrderDetailsScreen extends StatefulWidget {
   OrderDetailsScreen({Key? key,  this.model,  this.index,  this.notes}) : super(key: key);
   final DataClientOrders? model;
   final int ?index;
   final String ?notes;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
   var customerNoteController =TextEditingController();



   String link =
       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxiJQBK4qrR_l2f3OHLP0IdXggEoOH-3OVgQ&usqp=CAU';

   @override
  void initState() {
     print('order index${widget.index}');
     print(widget.notes);
     customerNoteController.text = widget.notes!;


    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit()..getClientProfile()..getOffersDeal(widget.model!.id!),
      child: BlocConsumer<TransactionCubit,TransactionStates>(
        listener: (context, state) {

        },
        builder: (context,state){
          if(TransactionCubit.get(context).getOffersDealModel != null
              &&TransactionCubit.get(context).clientProfileModel != null) {
            return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const CircleAvatar(radius: 50,backgroundImage: AssetImage('assests/logos/logo4.png')),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TransactionCubit.get(context).clientProfileModel!
                            .data!
                            .name!,style:
                        TextStyle
                          (fontSize: 22,color:
                        KMainColor)),
                        Text(widget.model!.service!.name!),

                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(widget.model!.service!.name!),
              SizedBox(height: 25,),
              Text('order notes',style: TextStyle(fontSize: 18,color: KMainColor)),
              SizedBox(height: 10,),

              TextFormField(controller: customerNoteController,
                maxLines: 3,
                minLines: 3,
                decoration: InputDecoration(

                  //     contentPadding: const
                  // EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
                    hintText: 'Describe your '
                        'require task',border: OutlineInputBorder
                  (borderRadius: BorderRadius.circular(20))),),
              const SizedBox(height: 20,),

              Text('Provided Images',style: TextStyle(fontSize: 18,color: KMainColor)),

              SizedBox(height: 10,),
              SizedBox(
                height: 90,
                child: ListView.separated(physics: BouncingScrollPhysics(),scrollDirection:
                Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder:
                      (context, index) =>
                      Container(height:
                      90,width: 90,decoration: BoxDecoration
                        (borderRadius: BorderRadius.circular(20),color: Colors.red,
                          image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2016/08/26/22/45/chain-1623322_960_720.jpg'),fit: BoxFit.cover))) ,
                  itemCount:
                  10, separatorBuilder: (BuildContext context, int index) { return
                    SizedBox(width: 30,); },),
              ),
              SizedBox(height: 20,),
              Row(
                children:  <Widget>[
                  Icon(Icons.location_on_rounded,color: KJobColor),
                  Text(widget.model!.address!,style: TextStyle(fontSize: 18,color: KMainColor)),
                ],
              ),
              SizedBox(height: 20,),
                  if(TransactionCubit.get(context).getOffersDealModel!.data!.isNotEmpty)
              Text('List of Offered Prices',style: TextStyle(fontSize: 18,color: KMainColor)),
                  SizedBox(height: 20,),
               if(TransactionCubit.get(context).getOffersDealModel!.data!.isNotEmpty)
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildBestTech(
                          context, TransactionCubit.get(context).getOffersDealModel!
                          .data![index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: TransactionCubit.get(context).getOffersDealModel!
                        .data!.length),
              ),
                  if(TransactionCubit.get(context).getOffersDealModel!.data!
                      .isEmpty)
                    const Text('There is no offers yet',style: TextStyle(fontSize: 18,color: KMainColor)),

          ],),
          ),);
          }
          else {
            return Scaffold(body: Center(child:  CircularProgressIndicator(),));
          }
        ///done
        }
      ),
    );
  }

   Widget buildBestTech(context, DataOfferDeal model) {
     return Column(
       children: [
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: NetworkImage(model.technical!.image! == null ||
                       model.technical!.image?.startsWith('public') == true
                       ? link
                       : model.technical!.image!),
                   fit: BoxFit.contain),
               border: Border.all(color: KMainColor, width: 2),
               borderRadius: BorderRadius.circular(50)),
           width: 100,
           height: 120,
           // child: Image(image: NetworkImage(link),fit: BoxFit.fitWidth,),
         ),
         SizedBox(
           height: 5,
         ),
         Text(
           model.technical!.name!,
           style: Theme.of(context)
               .textTheme
               .bodyMedium!
               .copyWith(color: KMainColor),
         ),
         Text(model.total!,
           style:
           Theme.of(context).textTheme.bodySmall!.copyWith(color: KJobColor),
         ),
     OutlinedButton(
       onPressed: () {

       },
       child: Text('Accept Offer', style: TextStyle(color: KMainColor)),
       clipBehavior: Clip.antiAliasWithSaveLayer,
       style: OutlinedButton.styleFrom(
           side: BorderSide(width: 1, color: KMainColor),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30))),
     ),

         // Row(
         //   children: List.generate(5, (index) => ratingIcon),
         // ),
         // OutlinedButton(
         //   onPressed: () {
         //     Navigator.of(context).push(MaterialPageRoute(builder: (context)
         //     => CreateOrderScreen(serviceID: 1,serviceName: model.userService!
         //         .subCategory!.name!),));
         //   },
         //   child: Text('Order Now', style: TextStyle(color: KMainColor)),
         //   clipBehavior: Clip.antiAliasWithSaveLayer,
         //   style: OutlinedButton.styleFrom(
         //       side: BorderSide(width: 1, color: KMainColor),
         //       shape: RoundedRectangleBorder(
         //           borderRadius: BorderRadius.circular(30))),
         // ),
       ],
     );
   }
}
