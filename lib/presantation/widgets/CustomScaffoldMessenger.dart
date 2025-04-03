import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Customscaffoldmessenger {
  static void showSuccessSnackBar(BuildContext context,String message)
  {
    if(context.mounted){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Column(
      children: [
        FaIcon(FontAwesomeIcons.circleCheck,color: Colors.white,),Center(child: Text(message,style: TextStyle(color: Colors.white,fontSize: 20))),
      ],
    ),backgroundColor: const Color.fromARGB(255, 70, 214, 13),));
    }

  }
  static void showErrorSnackBar(BuildContext context,String message)
  {
    if(context.mounted){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Column(
      children: [
        FaIcon(FontAwesomeIcons.triangleExclamation,color: Colors.white,),SizedBox(width: 20,)
        ,Center(child: Text(message,style: TextStyle(color: Colors.white,fontSize: 20))),
      ],
    ),backgroundColor: const Color.fromARGB(255, 255, 17, 0),));


  }
  }
  static void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
}