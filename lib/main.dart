import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/setting.dart';
import 'package:weather_app/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "star",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<IconData> icons = [
    Icons.thermostat_outlined,
    Icons.air,
    Icons.water_drop_outlined,
    Icons.wb_sunny_outlined,
    Icons.remove_red_eye_outlined,
    Icons.water,
  ];

  List<String> t = [
    "Feels like",
    "s wind",
    "Humidity",
    "uv",
    "Visibility",
    "Air Pressure"
  ];

  List<double> e = [];
  // List<Con> d = [Con(time: "f", icon: Icons.face, value: "df")];

  Location loco = Location();
  Current curr = Current();
  Forecast f = Forecast();
  WeatherModel wh = WeatherModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: const Color(0xFF222629),
      appBar: AppBar(
        title: Text(loco.country, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.note_add)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  textStyle: const TextStyle(color: Colors.amberAccent),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Setting(),
                                  ));
                            },
                            child: const Text(
                              "Setting",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(loco.name,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
            Padding(
              padding: const EdgeInsets.only(left: 210),
              child: Lottie.asset("assets/lottie/SUN.json",height: 50),

            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),

                Text(curr.tempC.toInt().toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 80,fontFeatures: [FontFeature.subscripts()])),
                //Text("0",style: TextStyle(color: Colors.white,)),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 4),
                  child: Text(
                    curr.condition.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),


                /* Column(
                  children: [
                    const Text(
                      "",
                      style: TextStyle(
                          fontFeatures: [FontFeature.subscripts()],
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Text(
                       curr.condition.text,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )*/
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    loco.localtime,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(loco.tzId,
                      style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            /*  ListView.builder(
             itemCount: 3,
             itemBuilder:(context, index){
             return Column(
               children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.deepOrangeAccent,
                )
               ],
             );
           },
           ),*/
            /*SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("Now", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("1:30pm", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("2:00pm", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("3:00pm", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("Now", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 90,
                      width: 50,
                      decoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: const Column(
                        children: [
                          Text("Now", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("33", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),*/

            const SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF151515)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 15,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 25,),
                      const Text(
                        "Today",
                        style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(width: 60,),
                      const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white,
                      ),
                      const Text("Sunny", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 73,),
                      Text(
                        "${curr.tempC.toInt().toString()}/${curr.tempC.toInt().toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 25,),
                      const Text(
                        "Tommorrw",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 33,),
                      const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white,
                      ),
                      const Text("Sunny", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 75,),
                      Text(
                        "${curr.tempC.toInt().toString()}/${curr.tempF.toInt().toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 25,),
                      const Text(
                        "sat",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 76,),
                      const Icon(
                        Icons.thunderstorm_outlined,
                        color: Colors.white,

                      ),
                      const Text("Thunderstorm",
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 25,),
                      Text(
                        "${curr.tempC.toInt().toString()}/${curr.tempF.toInt().toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(

                    children: [
                      const SizedBox(width: 25,),
                      const Text(
                        "sunday",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 52,),
                      const Icon(
                        Icons.thunderstorm_outlined,
                        color: Colors.white,
                      ),
                      const Text("Thunderstorm",
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 28,),
                      Text(
                        "${curr.tempC.toInt().toString()}/${curr.tempF.toInt().toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(

                    children: [
                      const SizedBox(width: 25,),
                      const Text(
                        "monday",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 50,),
                      const Icon(
                        Icons.cloud_outlined,
                        color: Colors.white,
                      ),
                      const Text(" cloud", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 78,),
                      Text(
                        "${curr.tempC.toInt().toString()}/${curr.tempF.toInt().toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 28, right: 10, left: 10),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const Text('15-Day weather forecast',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF151515)),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Icon(
                      Icons.grain,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Air Quality",
                        style: TextStyle(color: Colors.grey)),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Good ${curr.gustKph.toInt()}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Air quality is suitable for out activity.",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Container(
                      width: 290,
                      height: 4,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.green,
                            Colors.red,
                            Colors.orange,
                            Colors.purple,
                            Colors.pink
                          ])),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 195, bottom: 10),
              child: Text(
                "Wide details ${curr.condition.text}",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: curr.t.length,
              itemBuilder: (context, index) {
                final GridData g = curr.t[index] ;
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF151515),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Text(
                          g.title,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          g.value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Container(
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF151515)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Lottie.asset("assets/lottie/BG.json",height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Sunrise",style: TextStyle(color: Colors.grey,fontSize: 10),),
                      SizedBox(width: 4,),
                      Text("Sunset",style: TextStyle(color: Colors.grey,fontSize: 10),)
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("5:53AM",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 4,),
                      Text("7:27PM",style: TextStyle(color: Colors.white),)
                    ],
                  ),


                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  void getdata() async {
    try {
      var response = await Dio().get(
          "http://api.weatherapi.com/v1/current.json?key=1915b3f2c66c4f1693542137231306&q=jasdan");
      curr = Current.fromJson(response.data['current']);
      loco = Location.fromJson(response.data['location']);
      //f = Forecast.fromJson(response.data['forecast']);
      print(response.data);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}

// class Con {
//   final IconData icon;
//   final String time;
//   final String value;
//
//   Con({
//     required this.icon,
//     required this.time,
//     required this.value,
//   });
// }

/*
class Week {
  final String Today;
  final String Tomorrow;
  final String Monday;
  final String tuesday;
  final String wedneasday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;

  Week({
    required this.Today,
    required this.Tomorrow,
    required this.Monday,
    required this.tuesday,
    required this.wedneasday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });
}
*/
