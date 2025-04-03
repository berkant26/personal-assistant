import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final String hint_text;
  final bool isObscureText;
  final TextEditingController controller;
  const CustomTextField({super.key, required this .hint_text,required this.isObscureText,required this.controller});
  


  @override
  Widget build(BuildContext context) {
  return TextField(
    controller: controller,
    obscureText: isObscureText
    ,decoration: InputDecoration(
       hintText: hint_text,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
          borderRadius:BorderRadius.circular(10))
        ,filled: true,
         fillColor: const Color.fromRGBO(241, 244, 255, 1)
         ,contentPadding:EdgeInsets.symmetric(vertical: 20,horizontal: 15) ));



  }

}