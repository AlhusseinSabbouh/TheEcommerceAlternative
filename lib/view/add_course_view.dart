import 'package:ecmmerce_app/core/view_model/add_course_view_model.dart';
import 'package:ecmmerce_app/view/sql_view.dart';
import 'package:ecmmerce_app/view/widget/custom_button.dart';
import 'package:ecmmerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCoursesView extends GetWidget<AddCourseViewModel> {
  GlobalKey<FormState> _myKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Form(
          key: _myKey1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                    text: "Course Names",
                    onSaved: (String? name) {
                      controller.name = name;
                    },
                    validator: (String? value) {
                      if (value == null) print("error");
                      return "";
                    },
                    hintText: "enter the course"),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    text: "Course Hours",
                    onSaved: (String? hours) {
                      controller.hours = int.parse(hours.toString());
                    },
                    validator: (String? value) {
                      if (value == null) print("error");
                      return "";
                    },
                    hintText: "enter the hours"),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    text: "Course desc",
                    onSaved: (String? desc) {
                      controller.desc = desc;
                    },
                    validator: (String? value) {
                      if (value == null) print("error");
                      return "";
                    },
                    hintText: "enter the desc"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: CustomButton(
                      text: "add Course",
                      onPressed: () {
                        _myKey1.currentState?.save();
                        print(controller.desc);
                        print(controller.name);
                        print(controller.hours);

                        if (!_myKey1.currentState!.validate()) {
                          controller.addCourseToDatabase();
                          Get.offAll(SqlView());
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
