import 'package:flutter/material.dart';
import 'package:testing/pages/home_product_page/widget/customer_app_title_widget.dart';

class CustomerPriceWidget extends StatelessWidget {
  const CustomerPriceWidget(
      {super.key, required this.price, required this.favorite});
  final double price;
  final bool favorite;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Price : ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CustomerAppTitleWidget(
                title: r'$' '${price % 1 == 0 ? price.toInt() : price}'),
          ],
        ),
        favorite
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Text(''),
      ],
    );
  }
}
