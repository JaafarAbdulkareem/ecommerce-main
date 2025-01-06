import 'package:flutter/material.dart';

class CustomerDescrptionWidget extends StatelessWidget {
  const CustomerDescrptionWidget({super.key, required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        desc,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
