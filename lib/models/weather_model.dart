class WeatherModel {
  final String name;
  final String updated;
  final String? images;
  final double avgtemp;
  final double maxtemp;
  final double mintemp;
  final String condition;

  WeatherModel({
    required this.name,
    required this.updated,
    this.images,
    required this.avgtemp,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json){
   return WeatherModel(
    name: json ['location']['name'], 
   updated: json['current'] ['last_updated'], 
   avgtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'], 
   maxtemp:json['forecast']['forecastday'][0]['day']['maxtemp_c'], 
   mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'], 
   condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
   images:json['forecast']['forecastday'][0]['day']['condition']['icon'] );

  }
}
