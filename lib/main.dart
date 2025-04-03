import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_kid/firebase_options.dart';
import 'package:my_kid/presantation/bloc/login/login_bloc.dart';
import 'package:my_kid/presantation/screens/main_screen.dart';

void main () async {
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp(
  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        
      colorScheme: ColorScheme.light(
        primary: const Color.fromARGB(179, 6, 58, 230),
        secondary: const Color.fromARGB(255, 90, 85, 85)
      ),textTheme: TextTheme(headlineMedium: TextStyle(fontSize: 25,color: Color.fromRGBO(31, 65, 187, 1),fontWeight:FontWeight.bold,fontFamily: "roboto" ),
      headlineSmall: TextStyle(fontSize: 24,color: const Color.fromARGB(255, 38, 35, 226),fontWeight:FontWeight.bold,fontFamily: "roboto")),
      textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
       backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(244, 26, 72, 255)), // Button background color
       foregroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)), // Button text color
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 130, vertical: 20)), // Button padding
         shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Button corner radius
      ),
    ),
  ),
),
      ),
      
      home:  MainScreen(),
      
      
      
    );
      
    
  }
}


 
  

