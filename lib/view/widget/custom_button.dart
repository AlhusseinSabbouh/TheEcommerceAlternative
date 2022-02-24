import 'package:flutter/material.dart';

import '../../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(mainColor),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )))
/*           style: ElevatedButton.styleFrom(
              primary: mainColor, padding: EdgeInsets.all(18)) */
          ,
          onPressed: onPressed,
          child: CustomText(
            text: text,
            fontSize: 15,
            color: Colors.white,
            alignment: Alignment.center,
          )),
    );
  }
}
