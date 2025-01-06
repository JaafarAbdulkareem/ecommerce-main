import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/cubit/display_cubit/display_cubit.dart';

import '../../../constant/color_constant.dart';
import '../../../constant/scale_constant.dart';

class CustomerCategoryButtonWidget extends StatelessWidget {
  const CustomerCategoryButtonWidget({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<DisplayCubit>(context)
            .getCategoryProducts(category: categoryName);
        Navigator.pop(context);
      },
      child: Container(
        width: AppScale(context).width,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(16)),
            gradient: AppColor.gradient,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                color: Color(0xFFFFCDD2),
                blurRadius: 16.0,
              ),
              BoxShadow(
                offset: Offset(0, 0),
                color: Color(0xFFEF9A9A),
                blurRadius: 16.0,
              ),
              BoxShadow(
                offset: Offset(0, 0),
                color: Color(0xFFE57373),
                blurRadius: 16.0,
              ),
            ]),
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        // ),
      ),
    );
  }
}
