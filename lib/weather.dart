//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

/*
class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tz;
  int? localtime_eco;
  String localtime;

  Location({
    this.name = "",
    this.region = "",
    this.country = "",
    this.tz = "",
    this.lat = 0.0,
    this.lon = 0.0,
    this.localtime_eco = 0,
    this.localtime = "",
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] ?? "",
      region: json['region'] ?? "",
      country: json['country'] ?? "",
      tz: json['tz_id'] ?? "",
      localtime: json['localtime'] ?? "",
      lat: json['lat'] ?? 0.0,
      lon: json['lon'] ?? 0.0,
      localtime_eco: json['localtime_epoch'] ?? 0,
    );
  }

  Map<String, dynamic> tojson() => {
        "name": name,
      };
}

class Current {
  final int last_updated_epoch;
  final String last_updated;
  final double temp_c;
  final double temp_f;
  final int is_day;
  final double wind_mph;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double pressure_in;
  final double precip_mm;
  final double precip_in;
  final double humidity;
  final int cloud;
  final double feelslike_c;
  final double feelslike_f;
  final double vis_km;
  final double vis_miles;
  final double uv;
  final double gust_mph;
  final double gust_kph;
  final Condition condition;

  Current({
    this.last_updated_epoch = 0,
    this.last_updated = "",
    this.temp_c = 0.0,
    this.is_day = 0,
    this.temp_f = 0.0,
    this.wind_mph = 0.0,
    this.wind_kph = 0.0,
    this.wind_degree = 0,
    this.wind_dir = "",
    this.pressure_mb = 0.0,
    this.pressure_in = 0.0,
    this.precip_mm = 0.0,
    this.precip_in = 0.0,
    this.humidity = 0.0,
    this.cloud = 0,
    this.feelslike_c = 0.0,
    this.feelslike_f = 0.0,
    this.vis_km = 0.0,
    this.vis_miles = 0.0,
    this.uv = 0.0,
    this.gust_mph = 0.0,
    this.gust_kph = 0.0,
    this.condition = const Condition(),
  });

String getDetails(int index){
    String detail = '';
    if(index ==0 ){
      detail = temp_c.toString();
    } else if(index == 1) {
      detail = temp_f.toString();
    }
    else if(index == 2){
      detail =
    }
    return detail;
  }


  List<GridData> get t => [
        GridData(
          icon: Icons.thermostat_outlined,
          title: "Feels like",
          value: "${feelslike_c.toInt().toString()} ",
        ),
        GridData(
          icon: Icons.air,
          title: "Air",
          value: "${wind_kph.toInt().toString()} Km/h",
        ),

       GridData(
        icon: Icons.water_drop_outlined,
        title: "Humidity",
        value: "${humidity.toInt().toString()} %",
    ),
    GridData(
        icon: Icons.wb_sunny_outlined,
        title: "uv",
        value: "${uv.toInt().toString()} Moderate",
    ),
    GridData(
        icon: Icons.remove_red_eye_outlined,
        title: "Visibility",
        value: "${vis_miles.toInt().toString()} Km",
    ),
    GridData(
        icon: Icons.water,
        title: "Air Pressure",
        value: "${wind_mph.toString()} hPa",
    ),



      ];

  factory Current.fromJson(Map<String, dynamic> curr) {
    try {
      curr.keys.forEach((element) {
        print('$element ${curr[element].runtimeType}');
      });
      return Current(
        last_updated_epoch: curr['last_update_epoch'] ?? 0,
        last_updated: curr['last_updated'] ?? "",
        is_day: curr['is_day'] ?? 0,
        temp_c: double.tryParse('${curr['temp_c']}') ?? 0.0,
        temp_f: double.tryParse('${curr['temp_f']}') ?? 0.0,
        wind_kph: double.tryParse('${curr['wind_kph']}') ?? 0.0,
        wind_mph: double.tryParse('${curr['wind_mph']}') ?? 0.0,
        wind_degree: curr['wind_degree'] ?? 0,
        wind_dir: curr['wind_dir'] ?? "",
        pressure_in: double.tryParse('${curr['pressure_in']}') ?? 0.0,
        pressure_mb: double.tryParse('${curr['pressure_mb']}') ?? 0.0,
        precip_mm: double.tryParse('${curr['precip_mm']}') ?? 0.0,
        precip_in: double.tryParse('${curr['precip_in']}') ?? 0.0,
        humidity: double.tryParse('${curr['humidity']}') ?? 0.0,
        cloud: curr['cloud'] ?? 0,
        feelslike_c: double.tryParse('${curr['feelslike_c']}') ?? 0.0,
        feelslike_f: double.tryParse('${curr['feelslike_f']}') ?? 0.0,
        gust_kph: double.tryParse('${curr['gust_kph']}') ?? 0.0,
        gust_mph: double.tryParse('${curr['gust_mph']}') ?? 0.0,
        uv: double.tryParse('${curr['uv']}') ?? 0.0,
        vis_km: double.tryParse('${curr['vis_km']}') ?? 0.0,
        vis_miles: double.tryParse('${curr['vis_miles']}') ?? 0.0,
        condition: Condition.fromJson(curr["condition"] ?? {}),
      );
    } catch (e) {
      print('$e');
      return Current();
    }
  }
}

class Condition {
  final String text;
  final int code;

  const Condition({
    this.text = "",
    this.code = 0,
  });

  factory Condition.fromJson(Map<String, dynamic> con) {
    return Condition(
      text: con['text'] ?? "",
      code: con['code'] ?? 0,
    );
  }
  factory Condition.emptyJson() {
    return Condition(
      text: "",
      code: 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "code": code,
      };
}

*/

/*
class GridData {
  final IconData icon;
  final String title;
  final String value;

  GridData({
    required this.icon,
    required this.title,
    required this.value,
  });
}
*/
