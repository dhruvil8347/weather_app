//forecast
//day


class Forecast
{
  DateTime? date; //"2023-06-16",
  int dateEpoch; //1686873600,
  Day day;
  Astro astro;



  Forecast({
    this.date,
    this.dateEpoch = 0,
    this.day = const Day(),
    this.astro =  const Astro(),
  });
  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
      day: Day.fromJson(json["condition"] ?? {}),
      // astro: Astro.fromJson(json["astro"] ?? {}),

    );
  }

/*
{
  date ??= DateTime(0);
  astro ?? = DateTime(0);
}
*/

}


class Day
{
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
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;

  const Day({
    this.maxtempC = 0.0,
    this.maxtempF = 0.0,
    this.mintempC = 0.0,
    this.mintempF = 0.0,
    this.avgtempC = 0.0,
    this.avgtempF = 0.0,
    this.maxwindMph = 0.0,
    this.maxwindKph = 0.0,
    this.totalprecipMm = 0.0,
    this.totalprecipIn = 0.0,
    this.totalsnowCm = 0.0,
    this.avgvisKm = 0.0,
    this.avgvisMiles = 0.0,
    this.avghumidity = 0.0,
    this.dailyWillItRain = 0,
    this.dailyChanceOfRain = 0,
    this.dailyWillItSnow = 0,
    this.dailyChanceOfSnow = 0,
    this.condition = const Condition(),

  });

  factory Day.fromJson(Map<String, dynamic> json){
    return Day(
      maxtempC: double.tryParse('${json ['']}') ?? 0.0,
      avgtempF: double.tryParse('${json ['']}') ?? 0.0,
      condition: Condition.fromJson(json["address"] ?? {}),
    );
  }
}


//inner class of day
class Condition{

  final String text;
  final String icon;
  final int code;

  const Condition({
    this.text = "",
    this.icon = "",
    this.code = 0,
  });
  factory Condition.fromJson(Map<String, dynamic> json){
    return  Condition(
      code: json['code'] ?? 0,
      text: json['text'] ?? 0,
      icon: json['text'] ?? 0,

    );
  }
}


//astro class
class Astro {

  final String /*DateTime*/ sunrise; //"05:47 AM",
  final String /*DateTime*/ sunset;  //"09:56 PM",
  final String /*DateTime*/ moonrise; //04:12 AM",
  final String /*DateTime*/ moonset;  //"08:45 PM",
  final String /*DateTime*/ moonPhase;// Waning Crescent",
  final  int moonIllumination; // "5",
  final  int isMoonUp; //0,
  final  int isSunUp; //0

  const Astro({
    this.sunrise = "",
    this.sunset = "",
    this.moonrise = "",
    this.moonset= "",
    this.moonPhase= "",
    this.moonIllumination = 0,
    this.isMoonUp = 0,
    this.isSunUp = 0,
  });
/*
  {
    sunrise  ??= DateTime(0) ;
    sunset ??= DateTime(0) ;
    moonrise ??= DateTime(0) ;
    moonset ??= DateTime(0) ;
  }
*/

}





