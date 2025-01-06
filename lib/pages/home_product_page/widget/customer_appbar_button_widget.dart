import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';

class CustomerAppBarButtonWidget extends StatelessWidget {
  const CustomerAppBarButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 25,
        margin: const EdgeInsets.only(
          right: 4,
          bottom: 2,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18),
            bottomEnd: Radius.circular(18),
          ),
          gradient: AppColor.gradient,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}