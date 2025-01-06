
import 'package:flutter/material.dart';
import 'package:testing/model/rating_model.dart';

class CustomerFeatureStarWidget extends StatelessWidget {
  const CustomerFeatureStarWidget({
    super.key,
    required this.rate,
  });
  final RatingModule rate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: star(rate.rate.round()),
      ),
    );
  }

  List<Widget> star(int length) {
    List<Widget> listStarWidget = [];
    int length2 = 5 - length;
    for (int i = 0; i < length; i++) {
      listStarWidget.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    }
    for (int i = 0; i < length2; i++) {
      listStarWidget.add(
        const Icon(
          Icons.star,
          color: Colors.grey,
        ),
      );
    }

    return listStarWidget;
  }
}
