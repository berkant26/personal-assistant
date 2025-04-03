
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_kid/presantation/bloc/login/login_bloc.dart';
import 'package:my_kid/presantation/bloc/login/login_event.dart';
import 'package:my_kid/presantation/widgets/CustomTextField.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String login = "Giriş Yap";
    String userName = "Kullanıcı Adı";
    String password = "Şifre";
    late TextEditingController userNameController = TextEditingController();
    late TextEditingController passwordController = TextEditingController();


    var welcome = "Hoş Geldin";
    return Scaffold(
      body:Stack(
        children:[
          Container(
            decoration: BoxDecoration(
             // image: DecorationImage(image: AssetImage("assets/x.jpg"),fit: BoxFit.cover)
            ),
          ),
           Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                  Text(welcome,style: Theme.of(context).textTheme.headlineMedium),  
                  SizedBox(height: 50,),
                  CustomTextField(hint_text: userName, isObscureText: false,controller: userNameController),
                  SizedBox(height: 40,),
                  CustomTextField(hint_text: password, isObscureText: true,controller: passwordController),
                  SizedBox(height: 40,),
        
                    TextButton(onPressed: null,child: Text(login,style: TextStyle(fontSize: 20),)),
        
                   
                  ],
                  
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Row(
               mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(onPressed: () {
                    context.read<LoginBloc>().add(LoginWithX());
                  }, icon:Icon(FontAwesomeIcons.twitter,color: const Color.fromARGB(255, 54, 54, 54))),
                  IconButton(onPressed: null, icon:Icon(FontAwesomeIcons.google,color: const Color.fromARGB(255, 54, 54, 54))),
                  IconButton(onPressed: null, icon:Icon(FontAwesomeIcons.apple,color: const Color.fromARGB(255, 54, 54, 54))),
              
                ],
              ),
            ),
            SizedBox(height: 300,)
          ],
          
        ),]
      ),
    );
  }
  
}