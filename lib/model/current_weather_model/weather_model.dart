class WeatherModel{
String description;

WeatherModel({required this.description});

factory WeatherModel.fromJson(Map<String,dynamic> data){
  return WeatherModel(description:data['description']);
}
}
