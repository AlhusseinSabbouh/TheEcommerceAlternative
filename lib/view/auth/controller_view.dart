

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/view_model/auth_view_model.dart';
import '../../core/view_model/control_view_model.dart';
import '../home pages/home_view.dart';
import 'login_view.dart';

class ControllerView extends GetView<AuthViewModel> {
  GetStorage token = GetStorage();
  @override
  Widget build(BuildContext context) {
    print(token.read("email"));
    return GetBuilder<AuthViewModel>(builder: (controller) {
      return (controller.user != null)
          ? LogInView()
          : GetBuilder<ControlViewModel>(builder: (controller) {
              return Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavigatoinBar(),
              );
            });
    });
  }

  Widget _bottomNavigatoinBar() {
    return GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
        builder: (controller) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  label: "",
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Explore"),
                  ),
                  icon: Image.asset(
                    'assets/images/Icon_Explore.png',
                  )),
              BottomNavigationBarItem(
                  label: "",
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("Cart"),
                  ),
                  icon: Image.asset(
                    'assets/images/Icon_Cart.png',
                    fit: BoxFit.contain,
                  )),
              BottomNavigationBarItem(
                  label: "",
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Account"),
                  ),
                  icon: Image.asset(
                    'assets/images/Icon_User.png',
                    fit: BoxFit.contain,
                  ))
            ],
            currentIndex: controller.selectedNavigator,
            onTap: (index) {
              controller.changeSelectedNavigator(index);
            },
            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade100,
          );
        });
  }
}
