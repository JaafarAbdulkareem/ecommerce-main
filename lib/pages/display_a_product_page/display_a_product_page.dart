import 'package:flutter/material.dart';
import 'package:testing/constant/name_constant.dart';
import 'package:testing/model/products_model.dart';
import 'package:testing/pages/display_a_product_page/widget/customer_cached_image_widget.dart';
import 'package:testing/pages/display_a_product_page/widget/customer_descrption_widget.dart';
import 'package:testing/pages/display_a_product_page/widget/customer_feature_star_widget.dart';
import 'package:testing/pages/display_a_product_page/widget/customer_price_widget.dart';
import 'package:testing/pages/display_a_product_page/widget/customer_sale_button_widget.dart';
import 'package:testing/pages/home_product_page/widget/customer_app_title_widget.dart';

class DisplayAProductPage extends StatelessWidget {
  const DisplayAProductPage({super.key});
  static String id = 'Display a Product page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomerAppTitleWidget(title: AppTitle.mainTitle),
      ),
      body: BodyDisplayProductPage(
          data: ModalRoute.of(context)!.settings.arguments as ProductsModel),
    );
  }
}

class BodyDisplayProductPage extends StatelessWidget {
  const BodyDisplayProductPage({super.key, required this.data});
  final ProductsModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomerCachedImageWidget(image: data.image),
            CustomerAppTitleWidget(title: data.title),
            CustomerDescrptionWidget(desc: data.description),
            CustomerPriceWidget(price: data.price, favorite: data.favorite),
            CustomerFeatureStarWidget(rate: data.rate),
            const CustomerSaleButtonWidget(),
          ],
        ),
      ),
    );
  }
}
