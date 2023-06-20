
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  Location location = const Location();
  Current current = const Current();
  Forecast forecast = const Forecast();

  WeatherModel({this.location = const Location(),
    this.current = const Current(),
    this.forecast = const Forecast()
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location'] ?? "",
      current: json['current'] ?? "",
      forecast: json['forecast'] ?? "",
    );
  }

/*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location.toJson();
    data['current'] = current.toJson();
    data['forecast'] = forecast.toJson();
    return data;
  }*/
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  const Location({this.name = "",
    this.region = "",
    this.country = "",
    this.lat = 0.0,
    this.lon = 0.0,
    this.tzId = "",
    this.localtimeEpoch = 0,
    this.localtime = ""});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        name: json['name'],
        country: json['region'],
        lat: json['lat'],
        lon: json['lon'],
        localtime: json['localtime'],
        localtimeEpoch: json['localtime_epoch'],
        region: json['region'],
        tzId: json['tz_id']);
  }

/*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }*/
}

class Current {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final double humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  const Current({this.lastUpdatedEpoch = 0,
    this.lastUpdated = "",
    this.tempC = 0.0,
    this.tempF = 0.0,
    this.isDay = 0,
    this.condition = const Condition(),
    this.windMph = 0.0,
    this.windKph = 0.0,
    this.windDegree = 0,
    this.windDir = "",
    this.pressureMb = 0.0,
    this.pressureIn = 0.0,
    this.precipMm = 0.0,
    this.precipIn = 0.0,
    this.humidity = 0.0,
    this.cloud = 0,
    this.feelslikeC = 0.0,
    this.feelslikeF = 0.0,
    this.visKm = 0.0,
    this.visMiles = 0.0,
    this.uv = 0,
    this.gustMph = 0.0,
    this.gustKph = 0.0,
  });

  List<GridData> get t => [
      GridData(
        icon: Icons.thermostat_outlined,
        title: "Feels like",
        value: "${feelslikeC.toInt().toString()} ",
      ),
      GridData(
        icon: Icons.air,
        title: "Air",
        value: "${windKph.toInt().toString()} Km/h",
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
        value: "${visMiles.toInt().toString()} Km",
      ),
      GridData(
        icon: Icons.water,
        title: "Air Pressure",
        value: "${windMph.toString()} hPa",
      ),

    ];

  factory Current.fromJson(Map<String, dynamic>data){
    try {
      data.keys.forEach((element) {
        print('$element ${data[element].runtimeType}');
      });
      return Current(
        lastUpdatedEpoch: data['last_update_epoch'] ?? 0,
        lastUpdated: data['last_updated'] ?? "",
        isDay: data['is_day'] ?? 0,
        tempC: double.tryParse('${data['temp_c']}') ?? 0.0,
        tempF: double.tryParse('${data['temp_f']}') ?? 0.0,
        windKph: double.tryParse('${data['wind_kph']}') ?? 0.0,
        windMph: double.tryParse('${data['wind_mph']}') ?? 0.0,
        windDegree: data['wind_degree'] ?? 0,
        windDir: data['wind_dir'] ?? "",
        pressureIn: double.tryParse('${data['pressure_in']}') ?? 0.0,
        pressureMb: double.tryParse('${data['pressure_mb']}') ?? 0.0,
        precipMm: double.tryParse('${data['precip_mm']}') ?? 0.0,
        precipIn: double.tryParse('${data['precip_in']}') ?? 0.0,
        humidity: double.tryParse('${data['humidity']}') ?? 0.0,
        cloud: data['cloud'] ?? 0,
        feelslikeC: double.tryParse('${data['feelslike_c']}') ?? 0.0,
        feelslikeF: double.tryParse('${data['feelslike_f']}') ?? 0.0,
        gustKph: double.tryParse('${data['gust_kph']}') ?? 0.0,
        gustMph: double.tryParse('${data['gust_mph']}') ?? 0.0,
        uv: data['cloud'] ?? 0,
        visKm: double.tryParse('${data['vis_km']}') ?? 0.0,
        visMiles: double.tryParse('${data['vis_miles']}') ?? 0.0,
      );
    }catch (e) {
      print('$e');
      return Current();
    }

  }

 /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }*/
}

class Condition {
  final String text;
  final String icon;
  final int code;

  const Condition({
    this.text = "",
    this.icon = "",
    this.code = 0,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Forecast {
  final List<Forecastday> forecastday;

  const Forecast({this.forecastday = const []});

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
        forecastday: List<Forecastday>.from(json['forecastday'] ?? []
            .map((e) => Forecastday.fromJson(e))));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forecastday'] = forecastday.map((e) => const Forecastday()).toList();
    return data;
  }
}

class Forecastday {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  const Forecastday({
    this.date = "",
    this.dateEpoch = 0,
    this.day = const Day(),
    this.astro = const Astro(),
    this.hour = const []
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: json['date'],
      dateEpoch: json['date_epoch'],
      day: json['day'],
      astro: json['astro'],
      hour: List<Hour>.from((json['hour'] ?? []).map((e) => Hour.fromJson(e))),
    );
  }

/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    data['day'] = day!.toJson();
    data['astro'] = astro!.toJson();
    data['hour'] = hour!.map((v) => v.toJson()).toList();
    return data;
  }*/
}

class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final int totalsnowCm;
  final int avgvisKm;
  final int avgvisMiles;
  final int avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final int uv;

  const Day({this.maxtempC = 0.0,
    this.maxtempF = 0.0,
    this.mintempC = 0.0,
    this.mintempF = 0.0,
    this.avgtempC = 0.0,
    this.avgtempF = 0.0,
    this.maxwindMph = 0.0,
    this.maxwindKph = 0.0,
    this.totalprecipMm = 0.0,
    this.totalprecipIn = 0.0,
    this.totalsnowCm = 0,
    this.avgvisKm = 0,
    this.avgvisMiles = 0,
    this.avghumidity = 0,
    this.dailyWillItRain = 0,
    this.dailyChanceOfRain = 0,
    this.dailyWillItSnow = 0,
    this.dailyChanceOfSnow = 0,
    this.condition = const Condition(),
    this.uv = 0});


  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(

      maxtempC: json['maxtemp_c'],
      maxtempF: json['maxtemp_f'],
      mintempC: json['mintemp_c'],
      condition: Condition.fromJson(json["condition"] ?? {}),
      mintempF: json['mintemp_f'],
      avgtempC: json['avgtemp_c'],
      avgtempF: json['avgtemp_f'],
      maxwindMph: json['maxwind_mph'],
      maxwindKph: json['maxwind_kph'],
      totalprecipMm: json['totalprecip_mm'],
      totalprecipIn: json['totalprecip_in'],
      totalsnowCm: json['totalsnow_cm'],
      avgvisKm: json['avgvis_km'],
      avgvisMiles: json['avgvis_miles'],
      avghumidity: json['avghumidity'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
    );
  }

/*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mintemp_c'] = mintempC;
    data['mintemp_f'] = mintempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['totalsnow_cm'] = totalsnowCm;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailyWillItRain;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_will_it_snow'] = dailyWillItSnow;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    return data;
  }*/
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final String moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  const Astro({
    this.sunrise = "",
    this.sunset = "",
    this.moonrise = "",
    this.moonset = "",
    this.moonPhase = "",
    this.moonIllumination = "",
    this.isMoonUp = 0,
    this.isSunUp = 0,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      moonIllumination: json['moon_illumination'],
      isMoonUp: json['is_moon_up'],
      isSunUp: json['is_sun_up'],
    );
  }

/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    data['is_moon_up'] = isMoonUp;
    data['is_sun_up'] = isSunUp;
    return data;
  }*/
}

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final int pressureMb;
  final double pressureIn;
  final double precipMm;
  final int precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final int visKm;
  final int visMiles;
  final double gustMph;
  final double gustKph;
  final int uv;

  const Hour({
    this.timeEpoch = 0,
    this.time = "",
    this.tempC = 0.0,
    this.tempF = 0.0,
    this.isDay = 0,
    this.condition = const Condition(),
    this.windMph = 0,
    this.windKph = 0.0,
    this.windDegree = 0,
    this.windDir = "",
    this.pressureMb = 0,
    this.pressureIn = 0.0,
    this.precipMm = 0.0,
    this.precipIn = 0,
    this.humidity = 0,
    this.cloud = 0,
    this.feelslikeC = 0.0,
    this.feelslikeF = 0.0,
    this.windchillC = 0.0,
    this.windchillF = 0.0,
    this.heatindexC = 0.0,
    this.heatindexF = 0.0,
    this.dewpointC = 0.0,
    this.dewpointF = 0.0,
    this.willItRain = 0,
    this.chanceOfRain = 0,
    this.willItSnow = 0,
    this.chanceOfSnow = 0,
    this.visKm = 0,
    this.visMiles = 0,
    this.gustMph = 0.0,
    this.gustKph = 0.0,
    this.uv = 0,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
        timeEpoch: json['time_epoch'],
        time: json['time'],
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        condition: Condition.fromJson(json["condition"] ?? {}),
        isDay: json['is_day'],
        windMph: json['wind_mph'],
        windKph: json['wind_kph'],
        windDegree: json['wind_degree'],
        windDir: json['wind_dir'],
        pressureMb: json['pressure_mb'],
        pressureIn: json['pressure_in'],
        precipMm: json['precip_mm'],
        precipIn: json['precip_in'],
        humidity: json['humidity'],
        cloud: json['cloud'],
        feelslikeC: json['feelslike_c'],
        feelslikeF: json['feelslike_f'],
        windchillC: json['windchill_c'],
        windchillF: json['windchill_f'],
        heatindexC: json['heatindex_c'],
        heatindexF: json['heatindex_f'],
        dewpointC: json['dewpoint_c'],
        dewpointF: json['dewpoint_f'],
        willItRain: json['will_it_rain'],
        chanceOfRain: json['chance_of_rain'],
        willItSnow: json['will_it_snow'],
        chanceOfSnow: json['chance_of_snow'],
        visKm: json['vis_km'],
        visMiles: json['vis_miles'],
        gustMph: json['gust_mph'],
        gustKph: json['gust_kph'],
        uv: json['uv']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['will_it_rain'] = willItRain;
    data['chance_of_rain'] = chanceOfRain;
    data['will_it_snow'] = willItSnow;
    data['chance_of_snow'] = chanceOfSnow;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    data['uv'] = uv;
    return data;
  }
}


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
