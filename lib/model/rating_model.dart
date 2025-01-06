import 'package:testing/constant/name_constant.dart';

class RatingModule {
  final double rate;
  final int count;

  RatingModule({
    required this.rate,
    required this.count,
  });

  factory RatingModule.jsoncode(json) {
    return RatingModule(
      rate: double.parse(json[IndexRatingModel.rate].toString()),
      count: json[IndexRatingModel.count],
    );
  }
}
