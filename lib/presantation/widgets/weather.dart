import 'package:flutter/material.dart';
import 'package:my_kid/Core/const/Messages.dart';
import 'package:my_kid/data/entities/data_sources/weather_api.dart';
import 'package:my_kid/presantation/widgets/ResultMessage.dart';

class WeatherWidget extends StatelessWidget {
  final String city;
  final double height;
  final double width;

    const WeatherWidget({
    Key? key,
    required this.city,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Container(
      width: width,
      height: height,
      child: FutureBuilder(future: fetchWeather(city), builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
            ResultMessage.showErrorSnackBar(context,Messages.someThingWentWrong);
        }
      }),
     ),
    );
  }
}
