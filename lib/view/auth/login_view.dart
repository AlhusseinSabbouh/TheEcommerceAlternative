import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widget/custom_button.dart';
import '../widget/custom_social_buttom.dart';
import '../widget/custom_text.dart';
import '../widget/custom_text_form_field.dart';
import 'register_view.dart';

class LogInView extends GetWidget<AuthViewModel> {
  final String route = '/login';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
                      text: "Welcome,",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SingUpViewModel());
                      },
                      child: CustomText(
                        text: "Sing Up",
                        fontSize: 18,
                        color: mainColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                    text: "Sign in to continue",
                    fontSize: 14,
                    color: Colors.grey.shade800),
                SizedBox(
                  height: 35,
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
                CustomText(
                  text: "Forget password",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "SIGN IN",
                    onPressed: () {
                      _formKey.currentState?.save();
                      print("password is " + controller.password);
                      print("email is " + controller.email);
                      print(_formKey.currentState!.validate());
                      if (!_formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPasswordMethod();
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: "-OR-",
                  fontSize: 20,
                  alignment: Alignment.center,
                ),
                CustonSocialButtom(
                    image: "googleIcon.png",
                    onPressed: () {
                      print("he pressed log in with google");
                      controller.googleSignInMethod();
                    },
                    text: "Sign in with google"),
                SizedBox(
                  height: 10,
                ),
                CustonSocialButtom(
                    image: "facbookIcon.png",
                    onPressed: () {},
                    text: "Sign with facebook")
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
