import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:khadamatic_auth/cubit/worker/settings/technical_profile_cubit.dart';
import 'package:khadamatic_auth/cubit_states/worker/settings/technical_profile_cubit_states.dart';

class EditTechnicalData extends StatelessWidget {
  EditTechnicalData({Key? key}) : super(key: key);
  var aboutTechnicalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width * .99,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Positioned(child: Image.asset('assets/material/worker1.png',fit: BoxFit.fill,)),
                    Positioned(
                        bottom: 60,
                        left: 0,
                        child: Container(
                          color: Colors.grey,
                          height: MediaQuery.of(context).size.height * .30,
                          width: MediaQuery.of(context).size.width,
                        )),
                    const Positioned(
                      bottom: 1,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.person_outline,
                          size: 100,
                          color: Colors.black,
                        ),
                        radius: 60,
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      left: 150,
                      child: BlocBuilder<TechnicalProfileCubit,TechnicalProfileStates>(
                        builder: (context, snapshot) {
                          return Text(
                            '${(context.read<TechnicalProfileCubit>().technicalProfileDataModel!.data!.name)}',
                            style:const TextStyle(
                                color: Color.fromRGBO(108, 99, 255, 1),
                                // fontFamily: 'Prata',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1),

                          );
                        }
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      left: 280,
                      child: BlocBuilder<TechnicalProfileCubit,TechnicalProfileStates>(
                          builder: (context, snapshot) {
                            return Text(
                              '${(context.read<TechnicalProfileCubit>().technicalProfileDataModel!.data!.userAddress!.area!.name)}',
                              style:const TextStyle(
                                  color: Color.fromRGBO(108, 99, 255, 1),
                                  // fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1),

                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0)
                    ,child: const Text(
                      'عنه',
                      textAlign: TextAlign.start,
                      
                      style: TextStyle(
                          color: Color.fromRGBO(108, 99, 255, 1),
                          fontFamily: 'Prata',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10,15),
                    height: 100,
                    width: MediaQuery.of(context).size.width * .99,
                    decoration: BoxDecoration(
                      border: const Border(
                          top: BorderSide(
                            color: Color.fromRGBO(108, 99, 255, 1),
                            width: 2
                          ),
                          right: BorderSide(
                            color: Color.fromRGBO(108, 99, 255, 1),
                            width: 2
                          ),
                          bottom: BorderSide(
                            color: Color.fromRGBO(108, 99, 255, 1),
                            width: 2
                          ),
                          left: BorderSide(
                            color: Color.fromRGBO(108, 99, 255, 1),
                            width: 2
                          )),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: BlocBuilder<TechnicalProfileCubit,TechnicalProfileStates>(
                        builder: (context, snapshot) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              '${(context.read<TechnicalProfileCubit>().technicalProfileDataModel!.data!.description)}',
                              textAlign: TextAlign.start,
                              
                              style:const TextStyle(
                                  color: Color.fromRGBO(108, 99, 255, 1),
                                  // fontFamily: 'Prata',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1),

                            ),
                          );
                        }
                    ),
                    // TextFormField(
                    //   controller: aboutTechnicalController,
                    //   decoration:const InputDecoration(
                    //     border: InputBorder.none,
                    //   ),                      style: const TextStyle(
                    //       color: Color.fromRGBO(108, 99, 255, 1),
                    //       // fontFamily: 'Prata',
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.normal,
                    //       height: 1),
                    // ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0)
                    ,child: const Text(
                    'تقييمات العملاء',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromRGBO(108, 99, 255, 1),
                        fontFamily: 'Prata',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex:  2,
                          child:Column(
                            children: [
                              Row(
                                children: [
                                 const Expanded(
                                    child: Text(
                                      'الالتزام بالمواعيد',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color.fromRGBO(108, 99, 255, 1),
                                          fontFamily: 'Prata',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                  Expanded(child: RatingBarIndicator(
                                    rating: 5,
                                    itemBuilder: (context, index) =>const Icon(
                                       Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 14.0,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    direction:  Axis.horizontal,
                                  ),)
                                ],
                              ),
                              Row(
                                children: [
                                 const Expanded(
                                    child: Text(
                                      'جودة العمل',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color.fromRGBO(108, 99, 255, 1),
                                          fontFamily: 'Prata',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                  Expanded(child: RatingBarIndicator(
                                    rating: 2,
                                    itemBuilder: (context, index) =>const Icon(
                                       Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 14,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    direction:  Axis.horizontal,
                                  ),)
                                ],
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'السلوك الخاص',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color.fromRGBO(108, 99, 255, 1),
                                          fontFamily: 'Prata',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                  Expanded(child: RatingBarIndicator(
                                    rating: 2,
                                    itemBuilder: (context, index) =>const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 14.0,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    direction:  Axis.horizontal,
                                  ),)
                                ],
                              ),
                            ],
                          )),
                    const  Expanded(
                      flex: 1,
                      child: Text(
                        'تم التعامل مع \n         0\n عميل حتى الان ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromRGBO(108, 99, 255, 1),
                            fontFamily: 'Prata',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 5)
                    ,child: const Text(
                    'صور من العمل',
                    textAlign: TextAlign.start,

                    style: TextStyle(
                        color: Color.fromRGBO(108, 99, 255, 1),
                        fontFamily: 'Prata',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                  ),
                  Row(
                    children:const [
                      Expanded(child: Icon(Icons.image,size: 50,color: Colors.grey,)),
                      SizedBox(width: 5,),
                      Expanded(child: Icon(Icons.image,size: 50,color: Colors.grey)),
                      SizedBox(width: 5,),
                      Expanded(child: Icon(Icons.image,size: 50,color: Colors.grey)),

                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
