import 'package:flutter/material.dart';
import 'package:weather/repo.dart';
import 'package:weather/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel weatherModel = WeatherModel();
  double a = 0.0;
  String city = 'Rajshahi';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather APP"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/sky.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 220, 222, 224),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(width: .8),
                  ),
                  hintText: "Search a city",
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(99, 243, 240, 240)),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30.0,
                    color: Color.fromRGBO(10, 25, 44, 0.6),
                  ),
                ),
                controller: controller,
                // style: const Color.fromARGB(99, 240, 237, 237),
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                  onPressed: () async {
                    weatherModel = await Repo().getWeather(controller.text);
                    print(weatherModel.main?.temp ?? "error");
                    setState(() {});
                  },
                  child: const Text("search")),

              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(10.0),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            city,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                          ),
                          Text(
                            "${weatherModel.main?.temp}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 60,
                                color: Color.fromARGB(99, 180, 187, 202)),
                          ),
                        ],
                      ),
                      // Text(city , style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(100, 20, 100, 255)),),
                      Text(
                        "${weatherModel.main?.tempMin}/${weatherModel.main?.tempMax}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Feels like : ${weatherModel.main?.feelsLike}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Humidity : ${weatherModel.main?.humidity}   Sealevel : ${weatherModel.main?.seaLevel}   Pressure:${weatherModel.main?.pressure} ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(20.0),),
              const Text("Forecast of next days" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(99, 227, 230, 236)),),
              const Padding(padding: EdgeInsets.all(20.0),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/cloud.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      children: [
                          Text("32" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(0, 0, 0, 0.8))),
                         Padding(padding: EdgeInsets.all(7.0),),
                         Text("day" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(0, 0, 0, .8)),),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0),),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/cloud.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      
                    ),
                    child: const Column(
                      children: [
                          Text("32" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(0, 0, 0, 0.8))),
                         Padding(padding: EdgeInsets.all(7.0),),
                         Text("day" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(0, 0, 0, .8)),),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0),),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/cloud.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      children: [
                          Text("32" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(0, 0, 0, 0.8))),
                         Padding(padding: EdgeInsets.all(7.0),),
                         Text("day" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(0, 0, 0, .8)),),
                      ],
                    ),
                  ),

                  const Padding(padding: EdgeInsets.all(10.0),),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/cloud.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      children: [
                          Text("32" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(0, 0, 0, 0.8))),
                         Padding(padding: EdgeInsets.all(7.0),),
                         Text("day" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(0, 0, 0, .8)),),
                      ],
                    ),
                  ),
                ],
              ),
              // ListView(

              // ),

              // titleSection,
              // titleSection2,
              // info,
            ],
          ),
        ),
      ),
    );
  }
}
