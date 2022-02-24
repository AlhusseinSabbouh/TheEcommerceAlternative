import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_view_model.dart';
import '../widget/custom_button.dart';

import '../widget/custom_text.dart';
import '../widget/custom_text_form_field.dart';
import 'login_view.dart';

class SingUpViewModel extends GetWidget<AuthViewModel> {
  final String route = '/login';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.offAll(LogInView());
          },
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "SignUp,",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 35,
                ),
                CustomTextFormField(
                    text: "Name",
                    hintText: "enter your name",
                    onSaved: (value) {
                      controller.name = value!;
                    },
                    validator: (value) {
                      if (value == null) print("error");
                      return "";
                    }),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    text: "Email",
                    hintText: "iamdavid@gmail.com",
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      if (value == null) print("error");
                      return "";
                    }),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    hintText: "*********",
                    text: "password",
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      if (value == null) print("error");
                      return "";
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "SIGN UP",
                    onPressed: () {
                      _formKey.currentState?.save();
                      print("password is " + controller.password);
                      print("email is " + controller.email);
                      print(_formKey.currentState!.validate());
                      if (!_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
