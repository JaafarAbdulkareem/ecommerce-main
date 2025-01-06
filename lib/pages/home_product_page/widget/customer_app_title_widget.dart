import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constant/color_constant.dart';

class CustomerAppTitleWidget extends StatelessWidget {
  const CustomerAppTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.mainColor1,
      highlightColor: AppColor.mainColor2,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
