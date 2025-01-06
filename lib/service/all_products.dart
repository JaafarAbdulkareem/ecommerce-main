import 'package:testing/helper/api.dart';
import 'package:testing/model/products_model.dart';

import '../constant/name_constant.dart';

class AllProducts {
  static Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data = await Api().getProduct(
      uri: AppApi.base,
    );
    List<ProductsModel> allproductsList = [];
    for (int i = 0; i < data.length; i++) {
      allproductsList.add(
        ProductsModel.jsoncode(data[i]),
      );
    }
    return allproductsList;
  }
}
