import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:http/http.dart';

// late double latitude;
// late double longitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

    // print(temperture);
    // print(condition);
    // print(cityName);
  }

//   Future<void> getData() async {
//   final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=2ee7d0f18d5ec655d5bc3cac540c5fc8');

//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // API call was successful, handle the response here
//       final data = response.statusCode;
//       print(data);
//     } else {
//       // API call failed, handle the error here
//       print('API call failed with status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     // An error occurred while making the API call
//     print('Error: $e');
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
