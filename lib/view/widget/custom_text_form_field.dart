import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Function(String?)? onSaved;
  final String hintText;
  final String Function(String?)? validator;
  final int maxLength;
  CustomTextFormField(
      {required this.text,
      required this.onSaved,
      required this.validator,
      required this.hintText,
      this.maxLength = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey,
          ),
          TextFormField(
            maxLines: maxLength,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 18),
                fillColor: Colors.white),
            onSaved: onSaved,
            validator: validator,
          )
        ],
      ),
    );
  }
}
