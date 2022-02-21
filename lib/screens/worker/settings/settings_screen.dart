import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit/worker/settings/technical_profile_cubit.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';
import 'package:khadamatic_auth/screens/login_screen.dart';
import 'package:khadamatic_auth/screens/worker/settings/edit_technical_settings.dart';
import 'package:khadamatic_auth/sharedpref/sharedpref.dart';
import 'package:khadamatic_auth/widgets/settings/custom_settings_element_container.dart';
import '../../../cubit_states/worker/settings/technical_profile_cubit_states.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:BlocBuilder<TechnicalProfileCubit,TechnicalProfileStates>(
          builder: (context, state) {
            Widget getTechnicalText(){
              if (state is GetTechnicalDataLoadingState){
                return const  Center(child: SizedBox(height: 30,width: 20,child: CircularProgressIndicator(),),);
              }else{
                return Text(
                  '${(context.read<TechnicalProfileCubit>().technicalProfileDataModel!.data!.name)}',
                  style:const TextStyle(
                      color: Color.fromRGBO(108, 99, 255, 1),
                      fontFamily: 'Prata',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1),

                );
              }
            }
            return Column(
              children: [
                Card(
                  child:  Center(
                    child: Column(
                      children: [
                       const CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(Icons.person_outline,size: 160,color: Colors.blue,),
                          radius: 100,
                        ),
                       const SizedBox(height: 10,),
                        getTechnicalText(),
                       const  SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),
              const  SizedBox(
                  height: 5,
                ),
                CustomSettingsItemContainer(iconData: Icons.password, text: 'change password', onButtonTextTapped: (){}),
                CustomSettingsItemContainer(iconData: Icons.edit, text: 'edit you data', onButtonTextTapped: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTechnicalData()));
                  AuthenticationDioHelper.getTechnicalProfile(url: TechnicalProfile) ;               }),
                CustomSettingsItemContainer(iconData: Icons.phone, text: 'call us', onButtonTextTapped: (){}),
                CustomSettingsItemContainer(iconData: CupertinoIcons.textformat, text: 'change language', onButtonTextTapped: (){}),
                CustomSettingsItemContainer(iconData: CupertinoIcons.money_dollar, text: 'wallet', onButtonTextTapped: (){}),
                    CustomSettingsItemContainer(iconData: CupertinoIcons.share_up, text: 'share app', onButtonTextTapped: (){}),
                CustomSettingsItemContainer(iconData: Icons.logout, text: 'log out ', onButtonTextTapped: (){
                  SharedPref_Helper.sharedPreferences!.remove('token').then(
                          (value) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),
                                    (route) => false);
                          });
                }),
              ],
            );
          }
        ),

      ),
    );
  }
}
