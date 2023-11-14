import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/forecast.dart';

class Repo2 {
  getForecast(String? city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2&units=metric&cnt=5";

    final res = await http.get(Uri.parse(url));

    var resBody = res.body;
    // print(resBody);
    try {
      if (res.statusCode == 200) {
        return WeatherData.fromJson(json.decode(resBody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
