import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomerShimmerBuildingWidget extends StatelessWidget {
  const CustomerShimmerBuildingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 14,),
      itemCount: 8,
      itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.black54,
          highlightColor: Colors.black12,
          child: const CustomerShimmerItemsWidget(),),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
    );
  }
}

class CustomerShimmerItemsWidget extends StatelessWidget {
  const CustomerShimmerItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal,
      ),
    );
  }
}