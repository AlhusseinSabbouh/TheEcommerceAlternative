import 'package:ecmmerce_app/core/utiles/db_helper.dart';
import 'package:ecmmerce_app/core/view_model/add_course_view_model.dart';
import 'package:ecmmerce_app/view/add_course_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/course.dart';

class SqlView extends StatelessWidget {
  DbHelper helper = DbHelper();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLa"),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(AddCoursesView());
              },
              icon: Icon(Icons.ad_units))
        ],
      ),
      body: Center(
          child: GetBuilder<AddCourseViewModel>(
        init: AddCourseViewModel(),
        builder: (controller) {
          return ListView.builder(
              itemCount: controller.coursesLength,
              itemBuilder: (context, i) {
                return Container(
                  height: 40,
                  child: Text(controller.courses[i].name.toString()),
                );
              });
        },
      )),
    );
  }
}
