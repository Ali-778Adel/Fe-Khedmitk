import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadamatic_auth/constants/constants.dart';

class CustomTechnicalOrderContentItem extends StatelessWidget {
  Color? color;
String?name;
String?address;
String?decription;
String?total;
  CustomTechnicalOrderContentItem({Key? key, this.color,this.name,this.address,this.decription,this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        height: 140,
        width: MediaQuery.of(context).size.width * .99,
        decoration:const BoxDecoration(
            color: KMainColor,
            // border: Border(
            //     bottom:BorderSide(color: KJobColor,width: 1,style: BorderStyle.solid),
            //     right:BorderSide(color: KMainColor,width: 1,style: BorderStyle.solid),
            //     top:BorderSide(color: KMainColor,width: 1,style: BorderStyle.solid),
            //     left:BorderSide(color: KMainColor,width: 1,style: BorderStyle.solid),
            //
            // ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10))
        ),
        child: Column(
          children: [
             Expanded(
               flex: 2,
               child: Row(
                 children: [
                   Expanded(
                     flex: 3,
                     child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: [
                         const CircleAvatar(
                            child: Icon(Icons.person_outline,size: 16,color: KJobColor,),
                            radius: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text('$name ',
                                style:const TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.bold,
                                 color: KMainColor
                                ),
                              ),
                             const Text('douki-Giza ',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey
                                ),
                              )
                            ],
                          )
                        ],
                      ),
            ),
                   ),
                   const Expanded(
                     flex: 2,
                      child:  Text('time of work 30m ',
                       style: TextStyle(
                           fontSize: 10,
                           fontWeight: FontWeight.normal,
                           color: Colors.white
                       ),

                   ),
                    ),
                   const Expanded(
                     child:  Text('since 30 min',
                       style: TextStyle(
                           fontSize: 10,
                           fontWeight: FontWeight.bold,
                           color: KJobColor
                       ),),
                   ),
                   Icon(Icons.watch_later,size: 16,color: KJobColor,)
                 ],
               ),
             ),
             Expanded(child:
             Row(children: [
              const Icon(Icons.edit_off,size: 10,color: KJobColor,),
              const SizedBox(width: 4,),
                Text('$decription',
                 style:const TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.normal,
                     color: Colors.white
                 ),),
               Spacer(),
                Text('$total ',
                 style:const TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Colors.white
                 ),

               ),
             ],),),
             Expanded(child:
             Row(children: [
             const  Icon(Icons.location_on,size: 10,color: KJobColor,),
             const  SizedBox(width: 4,),
                Text(' $address',
                 style:const TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.normal,
                     color: Colors.white
                 ),),

             ],),),
          ],
        ),
      ),
    );
  }
}

Color? color;
Color chosseColor({required EnumState? state}) {
  switch (state) {
    case EnumState.SUCCESS:
      {
        return color = Colors.green;
      }
      break;
    case EnumState.WARNING:
      {
        return color = Colors.yellow;
      }
      break;
    case EnumState.ERROR:
      {
        return color = Colors.red;
      }
      break;
    default:
      {
        return color = Colors.blue;
      }
  }
}

enum EnumState { SUCCESS, WARNING, ERROR }
