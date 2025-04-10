import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> fetchWeather(String city) async {
  final apiKey = 'af3e6daa363194e49d39877e825eb527';
  final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}