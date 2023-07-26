class RatingModel {
  double rate;
  int count;

  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      count: json['count'],
      rate: json['rate'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "count":count,
    "rate":rate
  };
}
