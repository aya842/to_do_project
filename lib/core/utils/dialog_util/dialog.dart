
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtil{
   static void  showLoading (context,{ required String message, bool isDissmissable =false}){
     showDialog(
         barrierDismissible: isDissmissable,
         context: context, builder: (context)=>CupertinoAlertDialog(

          content: Row(
            children: [
              Text(message),
              const Spacer(),
              const CircularProgressIndicator(),
            ],
          ),
     ));

  }
  static void hide(context ){
     Navigator.pop(context);

  }
  static void showMessage(context, {String?Title,String?body,
  String?posActionTitle,
    String?NevActionTitle,VoidCallback?posAction,VoidCallback?NevAaction}){
    showDialog( context:context ,builder: (context)=>CupertinoAlertDialog(
     title:Title!=null?Text(Title):null ,
      content:body!=null?Text(body):null ,
      actions: [
        if (posActionTitle!=null)
          MaterialButton(onPressed: (){
            Navigator.pop(context);
            posAction?.call();
          },
         child:Text(posActionTitle)),
        if (NevActionTitle!=null)
          MaterialButton(onPressed: (){
            Navigator.pop(context);
            NevAaction?.call();
          },
              child:Text(NevActionTitle))

      ],

    ));


  }


}
