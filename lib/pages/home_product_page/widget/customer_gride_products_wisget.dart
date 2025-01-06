import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/constant/name_constant.dart';
import 'package:testing/model/products_model.dart';
import 'package:testing/pages/home_product_page/widget/customer_product_card_widget.dart';

class CustomerGrideProductsWidget extends StatelessWidget {
  const CustomerGrideProductsWidget({
    super.key,
    required this.data,
  });
  final List<ProductsModel> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 55,
        bottom: 14,
      ),
      child: data.isNotEmpty
          ? GridView.builder(
              clipBehavior: Clip.none,
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 64,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) => CustomerProductCardWidget(
                product: data[index],
              ),
            )
          : Center(
              child: Lottie.asset(
                AppLottie.favorite,
              ),
            ),
    );
  }
}
