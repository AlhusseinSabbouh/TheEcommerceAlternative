
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustonTextFormField extends StatelessWidget {
  final String text;
  final Function(String?)? onSaved;
  final String hintText;
  final String Function(String?)? validator;

  CustonTextFormField(
      {required this.text,
      required this.onSaved,
      required this.validator,
      required this.hintText});

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
