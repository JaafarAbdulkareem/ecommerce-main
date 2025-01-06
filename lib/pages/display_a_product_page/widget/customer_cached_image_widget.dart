import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/constant/name_constant.dart';
import 'package:testing/constant/scale_constant.dart';

class CustomerCachedImageWidget extends StatelessWidget {
  const CustomerCachedImageWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(
        child: CachedNetworkImage(
          width: AppScale(context).width! / 2,
          height: AppScale(context).height! / 3,
          imageUrl: image,
          placeholder: (context, url) => Lottie.asset(AppLottie.loading),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
