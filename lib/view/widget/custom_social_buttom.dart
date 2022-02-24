
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustonSocialButtom extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onPressed;

  CustonSocialButtom(
      {required this.image, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.grey.shade100),
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset('assets/images/${image}'),
            SizedBox(
              width: 90,
            ),
            CustomText(
              text: text,
              fontSize: 14,
            ),
          ],
        ));
  }
}
