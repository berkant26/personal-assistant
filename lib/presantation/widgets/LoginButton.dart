import 'package:flutter/material.dart';
import 'package:my_kid/presantation/bloc/login/login_event.dart';

class LoginButton extends StatelessWidget{
  final IconData icon;
  final String label;
  final LoginEvent event;
  const LoginButton({super.key,required this.icon,required this.label,required this.event});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:70,
      child: ElevatedButton.icon(
        onPressed: null, 
        label: Text(label),
        icon: Icon(icon,size: 40,color: Colors.black),
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(14))),
        ),
    );
  }}