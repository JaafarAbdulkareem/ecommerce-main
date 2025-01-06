import 'package:testing/constant/name_constant.dart';
import 'package:testing/model/rating_model.dart';

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final RatingModule rate;
  bool favorite;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rate,
    this.favorite = false,
  });

  factory ProductsModel.jsoncode(json) {
    return ProductsModel(
        id: json[IndexProductModel.id],
        title: json[IndexProductModel.title],
        price: json[IndexProductModel.price].toDouble(),
        category: json[IndexProductModel.category],
        description: json[IndexProductModel.description],
        image: json[IndexProductModel.image],
        rate: RatingModule.jsoncode(json[IndexProductModel.rating]));
  }

  get length => null;
}
