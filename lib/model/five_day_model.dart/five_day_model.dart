class FiveDayModel {
  List<double> temp;

  FiveDayModel({required this.temp});

  factory FiveDayModel.fromJson(Map<String, dynamic> data) {
    return FiveDayModel(temp: [
      data['list'][0]['main']['temp'],
      data['list'][1]['main']['temp'],
      data['list'][2]['main']['temp'],
      data['list'][3]['main']['temp'],
      data['list'][4]['main']['temp'],
      data['list'][5]['main']['temp'],
      data['list'][6]['main']['temp'],
      data['list'][7]['main']['temp'],
      data['list'][8]['main']['temp']
    ]);
  }
}
