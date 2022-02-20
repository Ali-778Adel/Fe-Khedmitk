import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomSettingsItemContainer extends StatelessWidget {
 final IconData?iconData;
 final String?text;
 final Function()?onButtonTextTapped;
  const CustomSettingsItemContainer({Key? key,required this.iconData,required this.text,required this.onButtonTextTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width*.96,
        margin: const EdgeInsets.all(5),
        decoration:const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26,style: BorderStyle.solid))
        ),
        child: Row(
          children: [
            const SizedBox( width: 10,),
            Icon(iconData,size: 18,color: Colors.black54,),
            const SizedBox( width: 10,),
            TextButton(
                onPressed: onButtonTextTapped,
                child: Text(
                  '$text',
                  style:const TextStyle(
                      color: Color.fromRGBO(108, 99, 255, 1),
                      fontFamily: 'Prata',

                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1),))
          ],
        ),
      ),
    );
  }
}
