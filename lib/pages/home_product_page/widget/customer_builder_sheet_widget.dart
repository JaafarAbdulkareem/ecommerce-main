import 'package:flutter/material.dart';
import 'package:testing/pages/home_product_page/widget/customer_app_title_widget.dart';
import 'package:testing/pages/home_product_page/widget/customer_category_button_widget.dart';

class CustomerBuilderSheetWidget extends StatelessWidget {
  const CustomerBuilderSheetWidget({
    super.key,
    required this.categoryList,
  });
  final List categoryList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const CustomerAppTitleWidget(title: 'Category'),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context, index) => CustomerCategoryButtonWidget(
              categoryName: categoryList[index],
            ),
          ),
        ),
      ],
    );
  }
}
