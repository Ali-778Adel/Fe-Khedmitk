import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/worker/worker_homepage_cubit.dart';
import 'package:khadamatic_auth/cubit_states/worker/worker_homepage_states.dart';
import 'package:khadamatic_auth/widgets/custom_elevated_button.dart';
import '../../constants/constants.dart';
import '../../models/get_offers_deal_model.dart';

class OrderDetailsScreenState extends StatelessWidget {
  var customerNoteController =TextEditingController();
  var offerdaelController=TextEditingController();



  String link =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxiJQBK4qrR_l2f3OHLP0IdXggEoOH-3OVgQ&usqp=CAU';



  @override
  Widget build(BuildContext context) {
    return
              Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: 900,
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
                                  children:const [
                                    Text('text skjdn',style:
                                    TextStyle
                                      (fontSize: 22,color:
                                    KMainColor)),
                                    Text('widget.model!.service!.name!'),

                                  ],
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text('widget.model!.service!.name!'),
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

                          const SizedBox(height: 10,),
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
                              Text('widget.model!.address!',style: TextStyle(fontSize: 18,color: KMainColor)),
                            ],
                          ),
                          SizedBox(height: 20,),
                            Text('List of Offered Prices',style: TextStyle(fontSize: 18,color: KMainColor)),
                          SizedBox(height: 20,),
                            Expanded(
                              child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics:const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return buildBestTech(
                                            context:context);
                                      },
                                      separatorBuilder: (context, index) =>const SizedBox(
                                        width: 10,
                                      ),
                                      itemCount: 2),

                            ),


                        ],),
                    ),
                  ),


            // else {
            //   return Scaffold(body: Center(child:  CircularProgressIndicator(),));
            // }
            ///done

      ),
    );
  }

  Widget buildBestTech({context, DataOfferDeal ?model}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: KMainColor, width: 2),
              borderRadius: BorderRadius.circular(50)),
          width: 100,
          height: 120,
          child: Image(image: NetworkImage('https://www.google.com/search?q=persons&sxsrf=APq-WBseasIhqsBmVTdA5RRFMQq6Z8ujJg:1645441811564&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwiGzLS11JD2AhV3hXIEHZK7C0EQ_AUoAXoECAIQAw&biw=1366&bih=657&dpr=1#imgrc=YV5XcVkQv3HRTM),fit: BoxFit.fitWidth',),
        )),
        SizedBox(
          height: 5,
        ),
        Text(
          'model.technical!.name!',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: KMainColor),
        ),
        Text('model.total!',
          style:
          Theme.of(context).textTheme.bodySmall!.copyWith(color: KJobColor),
        ),
        OutlinedButton(
          onPressed: () {
          Center(
            child: Dialog(
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: MediaQuery.of(context).size.width*.80,
                child:Column(
                  children: [
                    TextFormField(
                      controller: offerdaelController,
                      decoration:const InputDecoration(
                        hintText: 'Price'
                      ),
                    ),
                    SizedBox(height: 10,),
                     BlocBuilder<WorkerHomePageCubit,WorkerHomepageStates>(
                       builder: (context, state) {
                         return CustomElvateButton(buttonText: 'OfferDeal',function: (){
                           context.read<WorkerHomePageCubit>().acceptOffer(total: offerdaelController.text);
                         },);
                       }
                     )
                  ],
                )  ,
              ),
            ),
          );
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