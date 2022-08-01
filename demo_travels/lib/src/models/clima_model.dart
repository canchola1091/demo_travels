// To parse this JSON data, do
//
//     final climaModel = climaModelFromJson(jsonString);

import 'dart:convert';

ClimaModel climaModelFromJson(String str) => ClimaModel.fromJson(json.decode(str));

// String climaModelToJson(ClimaModel data) => json.encode(data.toJson());

class ClimaModel {

  final Coord? coord;
  final List<Weather>? weather;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final Sys? sys;
  final int? timezone;
  final String? name;

  ClimaModel({
    this.coord,
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.sys,
    this.timezone,
    this.name,
  });

  factory ClimaModel.fromJson(Map<String, dynamic> json) => ClimaModel(
    coord     : (json["coord"] == null) ? null : Coord.fromJson(json["coord"]),
    weather   : (json["weather"] == null) ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    main      : (json["main"] == null) ? null : Main.fromJson(json["main"]),
    visibility: (json["visibility"] == null) ? null : json["visibility"],
    wind      : (json["wind"] == null) ? null : Wind.fromJson(json["wind"]),
    clouds    : (json["clouds"] == null) ? null : Clouds.fromJson(json["clouds"]),
    sys       : (json["sys"] == null) ? null : Sys.fromJson(json["sys"]),
    timezone  : (json["timezone"] == null) ? null : json["timezone"],
    name      : (json["name"] == null) ? null : json["name"],
  );

  // Map<String, dynamic> toJson() => {
  //   "coord": coord == null ? null : coord.toJson(),
  //   "weather": weather == null ? null : List<dynamic>.from(weather.map((x) => x.toJson())),
  //   "main": main == null ? null : main.toJson(),
  //   "visibility": visibility == null ? null : visibility,
  //   "wind": wind == null ? null : wind.toJson(),
  //   "clouds": clouds == null ? null : clouds.toJson(),
  //   "sys": sys == null ? null : sys.toJson(),
  //   "timezone": timezone == null ? null : timezone,
  //   "name": name == null ? null : name,
  // };

}


class Clouds {

  final int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: (json["all"] == null) ? null : json["all"],
  );

    // Map<String, dynamic> toJson() => {
    //   "all": all == null ? null : all,
    // };

}


class Coord {

  final double? lon;
  final double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: (json["lon"] == null) ? null : json["lon"].toDouble(),
    lat: (json["lat"] == null) ? null : json["lat"].toDouble(),
  );

  // Map<String, dynamic> toJson() => {
  //   "lon": lon == null ? null : lon,
  //   "lat": lat == null ? null : lat,
  // };

}


class Main {

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp     : (json["temp"] == null) ? null : json["temp"].toDouble(),
    feelsLike: (json["feels_like"] == null) ? null : json["feels_like"].toDouble(),
    tempMin  : (json["temp_min"] == null) ? null : json["temp_min"].toDouble(),
    tempMax  : (json["temp_max"] == null) ? null : json["temp_max"].toDouble(),
    pressure : (json["pressure"] == null) ? null : json["pressure"],
    humidity : (json["humidity"] == null) ? null : json["humidity"],
  );

  // Map<String, dynamic> toJson() => {
  //   "temp": temp == null ? null : temp,
  //   "feels_like": feelsLike == null ? null : feelsLike,
  //   "temp_min": tempMin == null ? null : tempMin,
  //   "temp_max": tempMax == null ? null : tempMax,
  //   "pressure": pressure == null ? null : pressure,
  //   "humidity": humidity == null ? null : humidity,
  // };

}


class Sys {

  final String? country;
  final int? sunrise;
  final int? sunset;

  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

    

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    country: (json["country"] == null) ? null : json["country"],
    sunrise: (json["sunrise"] == null) ? null : json["sunrise"],
    sunset : (json["sunset"] == null) ? null : json["sunset"],
  );

  // Map<String, dynamic> toJson() => {
  //   "country": country == null ? null : country,
  //   "sunrise": sunrise == null ? null : sunrise,
  //   "sunset": sunset == null ? null : sunset,
  // };

}


class Weather {

  final String?  main;
  final String?  description;
  final String?  icon;

  Weather({
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    main       : (json["main"] == null) ? null : json["main"],
    description: (json["description"] == null) ? null : json["description"],
    icon       : (json["icon"] == null) ? null : json["icon"],
  );

  // Map<String, dynamic> toJson() => {
  //   "main": main == null ? null : main,
  //   "description": description == null ? null : description,
  //   "icon": icon == null ? null : icon,
  // };

}


class Wind {

  final double? speed;
  final int? deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: (json["speed"] == null) ? null : json["speed"].toDouble(),
    deg  : (json["deg"] == null) ? null : json["deg"],
  );

  // Map<String, dynamic> toJson() => {
  //   "speed": speed == null ? null : speed,
  //   "deg": deg == null ? null : deg,
  // };

}
