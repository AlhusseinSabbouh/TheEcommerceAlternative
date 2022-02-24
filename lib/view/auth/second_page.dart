import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String route = "/second_Page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("it is the second page"),
      ),
    );
  }
}
