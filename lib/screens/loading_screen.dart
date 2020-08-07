import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async{
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=439d4b804bc8187953eb36d2a8c26a02');
    if(response.statusCode == 200){
      String data = response.body;
      //print(data);
//      var lon = jsonDecode(data)['coord']['lon'];
//      print(lon);
//
//      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
//      print(weatherDescription);

      var temp = jsonDecode(data)['main']['temp'];
      var id = jsonDecode(data)['id'];
      var cityName = jsonDecode(data)['name'];
      print(cityName);
      print(id);
      print(temp);

    }else{
      print(response.statusCode);
    }



  }

  @override
  Widget build(BuildContext context) {
    String myStr = '15';
    getData();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(double.parse(myStr)),
        color: Colors.red,
      ),
    );
  }
}
