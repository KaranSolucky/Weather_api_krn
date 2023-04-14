class MainModel {
  double temp,temp_min, temp_max;

  MainModel({required this.temp_min, required this.temp_max,required this.temp});

  factory MainModel.fromJson(Map<String,dynamic> data){
    return MainModel(temp: data['temp'],
      temp_min: data['temp_min'],
      temp_max: data['temp_max']);
  }
}