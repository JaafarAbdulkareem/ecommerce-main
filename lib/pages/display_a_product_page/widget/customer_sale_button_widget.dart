import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';

class CustomerSaleButtonWidget extends StatelessWidget {
  const CustomerSaleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'BACK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 47, 235, 53)),
            ),
            onPressed: () {
              Navigator.pop(context);
              Flushbar(
                duration: AppSnackBar.duration,
                backgroundGradient: AppSnackBar.backgroundColor,
                title: 'THANK YOU',
                message: '(づ ᴗ _ᴗ)づ♡ || ( -_•)▄︻テحكـ━一💥',
                messageSize: AppSnackBar.messageSize,
                flushbarPosition: AppSnackBar.direction,
                messageColor: AppSnackBar.messageColor,
              ).show(context);
            },
            child: const Text(
              'BUY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
